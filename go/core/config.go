package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "XkcdComics",
			"slug": "xkcd-comics",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://xkcd.com",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"info0": map[string]any{},
			},
		},
		"entity": map[string]any{
			"info0": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "alt",
						"short": "Alt text / hover text for the comic",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "day",
						"req": true,
						"short": "Day of the month the comic was published",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "img",
						"req": true,
						"short": "URL to the comic image",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "link",
						"short": "Link to related content (often empty)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "month",
						"req": true,
						"short": "Month the comic was published",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "news",
						"short": "News or announcements (often empty)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "num",
						"req": true,
						"short": "Comic number/ID",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "safe_title",
						"short": "URL-safe version of the comic title",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "title",
						"req": true,
						"short": "Title of the comic",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "transcript",
						"short": "Text transcript of the comic (when available)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "year",
						"req": true,
						"short": "Year the comic was published",
						"type": "`$STRING`",
					},
				},
				"name": "info0",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 614,
											"kind": "param",
											"name": "comic_id",
											"orig": "comic_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/{comic_id}/info.0.json",
								"parts": []any{
									"{comic_id}",
									"info.0.json",
								},
								"select": map[string]any{
									"exist": []any{
										"comic_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/info.0.json",
								"parts": []any{
									"info.0.json",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
