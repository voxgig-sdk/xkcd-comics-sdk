# Typed models for the XkcdComics SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Info0:
    day: str
    img: str
    month: str
    num: int
    title: str
    year: str
    alt: Optional[str] = None
    link: Optional[str] = None
    new: Optional[str] = None
    safe_title: Optional[str] = None
    transcript: Optional[str] = None


@dataclass
class Info0LoadMatch:
    comic_id: int

