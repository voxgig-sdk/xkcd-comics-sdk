# XkcdComics SDK configuration


def make_config():
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
            "active": True,
            "name": "alt",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "day",
            "req": True,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "img",
            "req": True,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "link",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "month",
            "req": True,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "new",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "num",
            "req": True,
            "type": "`$INTEGER`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "safe_title",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "title",
            "req": True,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "transcript",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "year",
            "req": True,
            "type": "`$STRING`",
            "index$": 10,
          },
        ],
        "name": "info0",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": 614,
                      "kind": "param",
                      "name": "comic_id",
                      "orig": "comic_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                      "index$": 0,
                    },
                  ],
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
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
                "index$": 1,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
