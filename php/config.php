<?php
declare(strict_types=1);

// XkcdComics SDK configuration

class XkcdComicsConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "XkcdComics",
                "slug" => "xkcd-comics",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://xkcd.com",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "info0" => [],
                ],
            ],
            "entity" => [
        'info0' => [
          'fields' => [
            [
              'name' => 'alt',
              'short' => 'Alt text / hover text for the comic',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'day',
              'req' => true,
              'short' => 'Day of the month the comic was published',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'img',
              'req' => true,
              'short' => 'URL to the comic image',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'link',
              'short' => 'Link to related content (often empty)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'month',
              'req' => true,
              'short' => 'Month the comic was published',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'news',
              'short' => 'News or announcements (often empty)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'num',
              'req' => true,
              'short' => 'Comic number/ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'safe_title',
              'short' => 'URL-safe version of the comic title',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'title',
              'req' => true,
              'short' => 'Title of the comic',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'transcript',
              'short' => 'Text transcript of the comic (when available)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'year',
              'req' => true,
              'short' => 'Year the comic was published',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'info0',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'example' => 614,
                        'kind' => 'param',
                        'name' => 'comic_id',
                        'orig' => 'comic_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/{comic_id}/info.0.json',
                  'parts' => [
                    '{comic_id}',
                    'info.0.json',
                  ],
                  'select' => [
                    'exist' => [
                      'comic_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/info.0.json',
                  'parts' => [
                    'info.0.json',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return XkcdComicsFeatures::make_feature($name);
    }
}
