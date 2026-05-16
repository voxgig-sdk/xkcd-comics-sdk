<?php
declare(strict_types=1);

// XkcdComics SDK utility: prepare_body

class XkcdComicsPrepareBody
{
    public static function call(XkcdComicsContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
