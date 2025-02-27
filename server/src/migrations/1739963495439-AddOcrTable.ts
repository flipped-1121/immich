import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddOcrTable1739963495439 implements MigrationInterface {
  name = 'AddOcrTable1739963495439';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`CREATE TABLE IF NOT EXISTS "asset_ocr" ("id" uuid NOT NULL DEFAULT uuid_generate_v4(), "assetId" uuid NOT NULL, "text" text, CONSTRAINT "PK_asset_ocr_id" PRIMARY KEY ("id"))`);
    await queryRunner.query(`ALTER TABLE "asset_ocr" ADD CONSTRAINT "FK_asset_ocr_assetId" FOREIGN KEY ("assetId") REFERENCES "assets"("id") ON DELETE CASCADE ON UPDATE CASCADE`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`ALTER TABLE "asset_ocr" DROP CONSTRAINT "FK_asset_ocr_assetId"`);
    await queryRunner.query(`DROP TABLE "asset_ocr"`);
  }
}
