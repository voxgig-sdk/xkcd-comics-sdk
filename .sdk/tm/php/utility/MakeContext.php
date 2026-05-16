<?php
declare(strict_types=1);

// XkcdComics SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class XkcdComicsMakeContext
{
    public static function call(array $ctxmap, ?XkcdComicsContext $basectx): XkcdComicsContext
    {
        return new XkcdComicsContext($ctxmap, $basectx);
    }
}
