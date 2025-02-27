# -*- encoding=utf-8 -*-
"""
    @Author: Kang
    @Modifier:
    @Date: 2025/2/20 18:12
    @Description:
"""

import time
from typing import Any

import numpy as np
from numpy.typing import NDArray
from paddleocr import PaddleOCR

from app.models.base import InferenceModel
from app.schemas import OCROutput, ModelTask, ModelType


class PaddleOCRModel(InferenceModel):
    depends = []
    identity = (ModelType.OCR, ModelTask.OCR)

    def __init__(self, model_name: str, min_score: float = 0.9, **model_kwargs: Any) -> None:
        self.min_score = model_kwargs.pop("minScore", min_score)
        super().__init__(model_name, **model_kwargs)
        self._load()
        self.loaded = True

    def _load(self) -> None:
        start_time = time.time()
        print(f"Loading PaddleOCR model: {self.model_name}")
        self.model = PaddleOCR()
        end_time = time.time()
        print(f"PaddleOCR model loaded in {end_time - start_time} seconds")

    def _predict(self, inputs: NDArray[np.uint8] | bytes, **kwargs: Any) -> OCROutput:
        result = self.model.ocr(np.array(inputs))
        if result[0] is None:
            return {
                "text": "",
                "confidence": 0.0,
            }
        text = ""
        confidence = 0.0
        for line in result[0]:
            if line[1][1] > self.min_score:
                text += line[1][0]
                confidence += line[1][1]
        return {
            "text": text,
            "confidence": confidence / len(result[0]),
        }
