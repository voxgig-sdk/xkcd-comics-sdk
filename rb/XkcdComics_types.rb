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
# @!attribute [rw] news
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
  :news,
  :num,
  :safe_title,
  :title,
  :transcript,
  :year,
  keyword_init: true
)

# Request payload for Info0#load.
#
# @!attribute [rw] alt
#   @return [String, nil]
#
# @!attribute [rw] day
#   @return [String, nil]
#
# @!attribute [rw] img
#   @return [String, nil]
#
# @!attribute [rw] link
#   @return [String, nil]
#
# @!attribute [rw] month
#   @return [String, nil]
#
# @!attribute [rw] news
#   @return [String, nil]
#
# @!attribute [rw] num
#   @return [Integer, nil]
#
# @!attribute [rw] safe_title
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] transcript
#   @return [String, nil]
#
# @!attribute [rw] year
#   @return [String, nil]
Info0LoadMatch = Struct.new(
  :alt,
  :day,
  :img,
  :link,
  :month,
  :news,
  :num,
  :safe_title,
  :title,
  :transcript,
  :year,
  keyword_init: true
)

