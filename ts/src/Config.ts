
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'XkcdComics',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://xkcd.com",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      info0: {
      },

    }
  }


  entity = {
    "info0": {
      "fields": [
        {
          "name": "alt",
          "type": "`$STRING`"
        },
        {
          "name": "day",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "img",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "link",
          "type": "`$STRING`"
        },
        {
          "name": "month",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "news",
          "type": "`$STRING`"
        },
        {
          "name": "num",
          "req": true,
          "type": "`$INTEGER`"
        },
        {
          "name": "safe_title",
          "type": "`$STRING`"
        },
        {
          "name": "title",
          "req": true,
          "type": "`$STRING`"
        },
        {
          "name": "transcript",
          "type": "`$STRING`"
        },
        {
          "name": "year",
          "req": true,
          "type": "`$STRING`"
        }
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
                    "reqd": true,
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/{comic_id}/info.0.json",
              "parts": [
                "{comic_id}",
                "info.0.json"
              ],
              "select": {
                "exist": [
                  "comic_id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/info.0.json",
              "parts": [
                "info.0.json"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

