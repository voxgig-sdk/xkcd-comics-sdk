
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    }

  }


  options = {
    base: 'https://xkcd.com',

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
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 0
        },
        {
          "name": "day",
          "req": true,
          "type": "`$STRING`",
          "active": true,
          "index$": 1
        },
        {
          "name": "img",
          "req": true,
          "type": "`$STRING`",
          "active": true,
          "index$": 2
        },
        {
          "name": "link",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 3
        },
        {
          "name": "month",
          "req": true,
          "type": "`$STRING`",
          "active": true,
          "index$": 4
        },
        {
          "name": "new",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 5
        },
        {
          "name": "num",
          "req": true,
          "type": "`$INTEGER`",
          "active": true,
          "index$": 6
        },
        {
          "name": "safe_title",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 7
        },
        {
          "name": "title",
          "req": true,
          "type": "`$STRING`",
          "active": true,
          "index$": 8
        },
        {
          "name": "transcript",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 9
        },
        {
          "name": "year",
          "req": true,
          "type": "`$STRING`",
          "active": true,
          "index$": 10
        }
      ],
      "name": "info0",
      "op": {
        "load": {
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
                    "type": "`$INTEGER`",
                    "active": true
                  }
                ]
              },
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
              },
              "active": true,
              "index$": 0
            },
            {
              "method": "GET",
              "orig": "/info.0.json",
              "parts": [
                "info.0.json"
              ],
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "args": {},
              "select": {},
              "index$": 1
            }
          ],
          "input": "data",
          "key$": "load"
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

