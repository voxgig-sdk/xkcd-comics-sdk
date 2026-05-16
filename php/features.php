<?php
declare(strict_types=1);

// XkcdComics SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class XkcdComicsFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new XkcdComicsBaseFeature();
            case "test":
                return new XkcdComicsTestFeature();
            default:
                return new XkcdComicsBaseFeature();
        }
    }
}
