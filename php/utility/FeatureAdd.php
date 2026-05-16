<?php
declare(strict_types=1);

// XkcdComics SDK utility: feature_add

class XkcdComicsFeatureAdd
{
    public static function call(XkcdComicsContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
