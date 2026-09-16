# XkcdComics SDK configuration

module XkcdComicsConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "XkcdComics",
        "slug" => "xkcd-comics",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://xkcd.com",
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
              "short" => "Alt text / hover text for the comic",
              "type" => "`$STRING`",
            },
            {
              "name" => "day",
              "req" => true,
              "short" => "Day of the month the comic was published",
              "type" => "`$STRING`",
            },
            {
              "format" => "uri",
              "name" => "img",
              "req" => true,
              "short" => "URL to the comic image",
              "type" => "`$STRING`",
            },
            {
              "name" => "link",
              "short" => "Link to related content (often empty)",
              "type" => "`$STRING`",
            },
            {
              "name" => "month",
              "req" => true,
              "short" => "Month the comic was published",
              "type" => "`$STRING`",
            },
            {
              "name" => "news",
              "short" => "News or announcements (often empty)",
              "type" => "`$STRING`",
            },
            {
              "name" => "num",
              "req" => true,
              "short" => "Comic number/ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "safe_title",
              "short" => "URL-safe version of the comic title",
              "type" => "`$STRING`",
            },
            {
              "name" => "title",
              "req" => true,
              "short" => "Title of the comic",
              "type" => "`$STRING`",
            },
            {
              "name" => "transcript",
              "short" => "Text transcript of the comic (when available)",
              "type" => "`$STRING`",
            },
            {
              "name" => "year",
              "req" => true,
              "short" => "Year the comic was published",
              "type" => "`$STRING`",
            },
          ],
          "name" => "info0",
          "op" => {
            "load" => {
              "input" => "data",
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
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/{comic_id}/info.0.json",
                  "segments" => [
                    {
                      "var" => "comic_id",
                    },
                    {
                      "lit" => "info.0.json",
                    },
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
                  "parts" => [
                    "{comic_id}",
                    "info.0.json",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/info.0.json",
                  "segments" => [
                    {
                      "lit" => "info.0.json",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "info.0.json",
                  ],
                },
              ],
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
