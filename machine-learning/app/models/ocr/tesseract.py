# -*- encoding=utf-8 -*-
"""
    @Author: Kang
    @Modifier: 
    @Date: 2025/2/20 10:27
    @Description:
"""

from typing import Any

import numpy as np
from numpy.typing import NDArray

from app.models.base import InferenceModel
from app.schemas import OCROutput, ModelTask, ModelType


class TesseractModel(InferenceModel):
    depends = []
    identity = (ModelType.OCR, ModelTask.OCR)

    def __init__(self, model_name: str, **model_kwargs: Any) -> None:
        super().__init__(model_name, **model_kwargs)
    
    def _load(self) -> None:
        ...

    def _predict(self, inputs: NDArray[np.uint8] | bytes, **kwargs: Any) -> OCROutput:
        ...
