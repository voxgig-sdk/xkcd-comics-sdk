# XkcdComics SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "XkcdComics",
            "slug": "xkcd-comics",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
        "transport": "base",
      },
        },
        "options": {
            "base": "https://xkcd.com",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "info0": {},
            },
        },
        "entity": {
      "info0": {
        "fields": [
          {
            "name": "alt",
            "short": "Alt text / hover text for the comic",
            "type": "`$STRING`",
          },
          {
            "name": "day",
            "req": True,
            "short": "Day of the month the comic was published",
            "type": "`$STRING`",
          },
          {
            "name": "img",
            "req": True,
            "short": "URL to the comic image",
            "type": "`$STRING`",
          },
          {
            "name": "link",
            "short": "Link to related content (often empty)",
            "type": "`$STRING`",
          },
          {
            "name": "month",
            "req": True,
            "short": "Month the comic was published",
            "type": "`$STRING`",
          },
          {
            "name": "news",
            "short": "News or announcements (often empty)",
            "type": "`$STRING`",
          },
          {
            "name": "num",
            "req": True,
            "short": "Comic number/ID",
            "type": "`$INTEGER`",
          },
          {
            "name": "safe_title",
            "short": "URL-safe version of the comic title",
            "type": "`$STRING`",
          },
          {
            "name": "title",
            "req": True,
            "short": "Title of the comic",
            "type": "`$STRING`",
          },
          {
            "name": "transcript",
            "short": "Text transcript of the comic (when available)",
            "type": "`$STRING`",
          },
          {
            "name": "year",
            "req": True,
            "short": "Year the comic was published",
            "type": "`$STRING`",
          },
        ],
        "name": "info0",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": 614,
                      "kind": "param",
                      "name": "comic_id",
                      "orig": "comic_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/{comic_id}/info.0.json",
                "parts": [
                  "{comic_id}",
                  "info.0.json",
                ],
                "select": {
                  "exist": [
                    "comic_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/info.0.json",
                "parts": [
                  "info.0.json",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
