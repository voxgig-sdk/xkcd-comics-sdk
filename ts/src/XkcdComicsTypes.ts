// Typed models for the XkcdComics SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Info0 {
  alt?: string
  day: string
  img: string
  link?: string
  month: string
  new?: string
  num: number
  safe_title?: string
  title: string
  transcript?: string
  year: string
}

export interface Info0LoadMatch {
  comic_id: number
}

