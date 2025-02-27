import { QueryParameter } from '$lib/constants';
import type { OcrSearchDto } from '@immich/sdk';

export function getOcrSearchQuery(ocr: OcrSearchDto) {
  const searchParams = new URLSearchParams({
    [QueryParameter.QUERY]: JSON.stringify(ocr),
  });
  return searchParams.toString();
}
