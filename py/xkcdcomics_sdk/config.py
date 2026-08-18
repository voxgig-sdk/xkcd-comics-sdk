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
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
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
            "type": "`$STRING`",
          },
          {
            "name": "day",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "img",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "link",
            "type": "`$STRING`",
          },
          {
            "name": "month",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "news",
            "type": "`$STRING`",
          },
          {
            "name": "num",
            "req": True,
            "type": "`$INTEGER`",
          },
          {
            "name": "safe_title",
            "type": "`$STRING`",
          },
          {
            "name": "title",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "transcript",
            "type": "`$STRING`",
          },
          {
            "name": "year",
            "req": True,
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
