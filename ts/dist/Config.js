"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'XkcdComics',
        slug: "xkcd-comics",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://xkcd.com",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            info0: {},
        }
    };
    entity = {
        "info0": {
            "fields": [
                {
                    "name": "alt",
                    "short": "Alt text / hover text for the comic",
                    "type": "`$STRING`"
                },
                {
                    "name": "day",
                    "req": true,
                    "short": "Day of the month the comic was published",
                    "type": "`$STRING`"
                },
                {
                    "format": "uri",
                    "name": "img",
                    "req": true,
                    "short": "URL to the comic image",
                    "type": "`$STRING`"
                },
                {
                    "name": "link",
                    "short": "Link to related content (often empty)",
                    "type": "`$STRING`"
                },
                {
                    "name": "month",
                    "req": true,
                    "short": "Month the comic was published",
                    "type": "`$STRING`"
                },
                {
                    "name": "news",
                    "short": "News or announcements (often empty)",
                    "type": "`$STRING`"
                },
                {
                    "name": "num",
                    "req": true,
                    "short": "Comic number/ID",
                    "type": "`$INTEGER`"
                },
                {
                    "name": "safe_title",
                    "short": "URL-safe version of the comic title",
                    "type": "`$STRING`"
                },
                {
                    "name": "title",
                    "req": true,
                    "short": "Title of the comic",
                    "type": "`$STRING`"
                },
                {
                    "name": "transcript",
                    "short": "Text transcript of the comic (when available)",
                    "type": "`$STRING`"
                },
                {
                    "name": "year",
                    "req": true,
                    "short": "Year the comic was published",
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
                            "segments": [
                                {
                                    "var": "comic_id"
                                },
                                {
                                    "lit": "info.0.json"
                                }
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
                            "parts": [
                                "{comic_id}",
                                "info.0.json"
                            ]
                        },
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/info.0.json",
                            "segments": [
                                {
                                    "lit": "info.0.json"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "info.0.json"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map