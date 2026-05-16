<?php
declare(strict_types=1);

// XkcdComics SDK utility: prepare_headers

class XkcdComicsPrepareHeaders
{
    public static function call(XkcdComicsContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}
