<?php
declare(strict_types=1);

// Typed models for the XkcdComics SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Info0 entity data model. */
class Info0
{
    public ?string $alt = null;
    public string $day;
    public string $img;
    public ?string $link = null;
    public string $month;
    public ?string $new = null;
    public int $num;
    public ?string $safe_title = null;
    public string $title;
    public ?string $transcript = null;
    public string $year;
}

/** Request payload for Info0#load. */
class Info0LoadMatch
{
    public ?int $comic_id = null;
}

