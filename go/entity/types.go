// Typed models for the XkcdComics SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Info0 is the typed data model for the info0 entity.
type Info0 struct {
	Alt *string `json:"alt,omitempty"`
	Day string `json:"day"`
	Img string `json:"img"`
	Link *string `json:"link,omitempty"`
	Month string `json:"month"`
	New *string `json:"new,omitempty"`
	Num int `json:"num"`
	SafeTitle *string `json:"safe_title,omitempty"`
	Title string `json:"title"`
	Transcript *string `json:"transcript,omitempty"`
	Year string `json:"year"`
}

// Info0LoadMatch is the typed request payload for Info0.LoadTyped.
type Info0LoadMatch struct {
	ComicId int `json:"comic_id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
