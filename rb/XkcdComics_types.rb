# frozen_string_literal: true

# Typed models for the XkcdComics SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Info0 entity data model.
#
# @!attribute [rw] alt
#   @return [String, nil]
#
# @!attribute [rw] day
#   @return [String]
#
# @!attribute [rw] img
#   @return [String]
#
# @!attribute [rw] link
#   @return [String, nil]
#
# @!attribute [rw] month
#   @return [String]
#
# @!attribute [rw] new
#   @return [String, nil]
#
# @!attribute [rw] num
#   @return [Integer]
#
# @!attribute [rw] safe_title
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String]
#
# @!attribute [rw] transcript
#   @return [String, nil]
#
# @!attribute [rw] year
#   @return [String]
Info0 = Struct.new(
  :alt,
  :day,
  :img,
  :link,
  :month,
  :new,
  :num,
  :safe_title,
  :title,
  :transcript,
  :year,
  keyword_init: true
)

# Request payload for Info0#load.
#
# @!attribute [rw] comic_id
#   @return [Integer, nil]
Info0LoadMatch = Struct.new(
  :comic_id,
  keyword_init: true
)

