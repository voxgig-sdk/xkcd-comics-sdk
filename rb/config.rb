# XkcdComics SDK configuration

module XkcdComicsConfig
  def self.make_config
    {
      "main" => {
        "name" => "XkcdComics",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://xkcd.com",
        "auth" => {
          "prefix" => "Bearer",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "info0" => {},
        },
      },
      "entity" => {
        "info0" => {
          "fields" => [
            {
              "name" => "alt",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "day",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "img",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "link",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "month",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "new",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "num",
              "req" => true,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "safe_title",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "title",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "transcript",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 9,
            },
            {
              "name" => "year",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 10,
            },
          ],
          "name" => "info0",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 614,
                        "kind" => "param",
                        "name" => "comic_id",
                        "orig" => "comic_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/{comic_id}/info.0.json",
                  "parts" => [
                    "{comic_id}",
                    "info.0.json",
                  ],
                  "select" => {
                    "exist" => [
                      "comic_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
                {
                  "method" => "GET",
                  "orig" => "/info.0.json",
                  "parts" => [
                    "info.0.json",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 1,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    XkcdComicsFeatures.make_feature(name)
  end
end
