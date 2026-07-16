<?php
declare(strict_types=1);

// XkcdComics SDK base feature

class XkcdComicsBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(XkcdComicsContext $ctx, array $options): void {}
    public function PostConstruct(XkcdComicsContext $ctx): void {}
    public function PostConstructEntity(XkcdComicsContext $ctx): void {}
    public function SetData(XkcdComicsContext $ctx): void {}
    public function GetData(XkcdComicsContext $ctx): void {}
    public function GetMatch(XkcdComicsContext $ctx): void {}
    public function SetMatch(XkcdComicsContext $ctx): void {}
    public function PrePoint(XkcdComicsContext $ctx): void {}
    public function PreSpec(XkcdComicsContext $ctx): void {}
    public function PreRequest(XkcdComicsContext $ctx): void {}
    public function PreResponse(XkcdComicsContext $ctx): void {}
    public function PreResult(XkcdComicsContext $ctx): void {}
    public function PreDone(XkcdComicsContext $ctx): void {}
    public function PreUnexpected(XkcdComicsContext $ctx): void {}
}
