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
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/info.0.json",
                  "parts" => [
                    "info.0.json",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
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
