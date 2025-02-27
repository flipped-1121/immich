import { Injectable } from '@nestjs/common';
import { JOBS_ASSET_PAGINATION_SIZE } from 'src/constants';
import { OnJob } from 'src/decorators';
import {
  JobName,
  JobStatus,
  QueueName,
} from 'src/enum';
import { BaseService } from 'src/services/base.service';
import { JobOf } from 'src/types';
import { isOcrEnabled } from 'src/utils/misc';
import { getAssetFiles } from 'src/utils/asset.util';
import { usePagination } from 'src/utils/pagination';
import { WithoutProperty } from 'src/repositories/asset.repository';

@Injectable()
export class OcrService extends BaseService {
  @OnJob({ name: JobName.OCR_CLEANUP, queue: QueueName.BACKGROUND_TASK })
  async handleOcrCleanup(): Promise<JobStatus> {
    const ocr = await this.ocrRepository.getOcrWithoutText();
    await this.ocrRepository.delete(ocr);
    return JobStatus.SUCCESS;
  }

  @OnJob({ name: JobName.QUEUE_OCR, queue: QueueName.OCR })
  async handleQueueOcr({ force, nightly }: JobOf<JobName.QUEUE_OCR>): Promise<JobStatus> {
    const { machineLearning } = await this.getConfig({ withCache: false });
    if (!isOcrEnabled(machineLearning)) {
      return JobStatus.SKIPPED;
    }

    if (force) {
      await this.ocrRepository.deleteAllOcr();
    }

    const assetPagination = usePagination(JOBS_ASSET_PAGINATION_SIZE, (pagination) => {
      return force
        ? this.assetRepository.getAll(pagination, { isVisible: true })
        : this.assetRepository.getWithout(pagination, WithoutProperty.OCR);
    });

    for await (const assets of assetPagination) {
      await this.jobRepository.queueAll(
        assets.map((asset) => ({ name: JobName.OCR, data: { id: asset.id } })),
      );
    }

    return JobStatus.SUCCESS;
  }

  @OnJob({ name: JobName.OCR, queue: QueueName.OCR })
  async handleOcr({ id }: JobOf<JobName.OCR>): Promise<JobStatus> {
    const { machineLearning } = await this.getConfig({ withCache: true });
    if (!isOcrEnabled(machineLearning)) {
      return JobStatus.SKIPPED;
    }

    const relations = { files: true };
    const [asset] = await this.assetRepository.getByIds([id], relations);
    const { previewFile } = getAssetFiles(asset.files);
    if (!asset || !previewFile) {
      return JobStatus.FAILED;
    }
    const ocrResults = await this.machineLearningRepository.ocr(
      machineLearning.urls,
      previewFile.path,
      machineLearning.ocr
    );

    if (!ocrResults || ocrResults.text.length === 0) {
      this.logger.warn(`No OCR results for document ${id}`);
      return JobStatus.FAILED;
    }

    this.logger.debug(`OCR ${id} has OCR results`);

    const ocr = await this.ocrRepository.getOcrById(id);
    console.log(`OCR ${id} getOcrById: ${ocr}`);
    if (ocr) {
      this.logger.debug(`Updating OCR for ${id}`);
      console.log(`Updating OCR for ${id}`);
      await this.ocrRepository.updateOcrData(id, ocrResults.text);
    } else {
      this.logger.debug(`Inserting OCR for ${id}`);
      console.log(`Inserting OCR for ${id}`);
      await this.ocrRepository.insertOcrData(id, ocrResults.text);
    }

    await this.assetRepository.upsertJobStatus({
      assetId: asset.id,
      ocrAt: new Date(),
    });
    this.logger.debug(`Processed OCR for ${id}`);
    return JobStatus.SUCCESS;
  }

}