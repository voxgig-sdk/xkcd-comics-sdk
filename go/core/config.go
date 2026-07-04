package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "XkcdComics",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
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
						"active": true,
						"name": "alt",
						"req": false,
						"type": "`$STRING`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "day",
						"req": true,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "img",
						"req": true,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "link",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "month",
						"req": true,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "new",
						"req": false,
						"type": "`$STRING`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "num",
						"req": true,
						"type": "`$INTEGER`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "safe_title",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "title",
						"req": true,
						"type": "`$STRING`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "transcript",
						"req": false,
						"type": "`$STRING`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "year",
						"req": true,
						"type": "`$STRING`",
						"index$": 10,
					},
				},
				"name": "info0",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"active": true,
											"example": 614,
											"kind": "param",
											"name": "comic_id",
											"orig": "comic_id",
											"reqd": true,
											"type": "`$INTEGER`",
											"index$": 0,
										},
									},
								},
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
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 1,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
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
