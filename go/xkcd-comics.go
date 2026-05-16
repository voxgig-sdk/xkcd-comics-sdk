package voxgigxkcdcomicssdk

import (
	"github.com/voxgig-sdk/xkcd-comics-sdk/core"
	"github.com/voxgig-sdk/xkcd-comics-sdk/entity"
	"github.com/voxgig-sdk/xkcd-comics-sdk/feature"
	_ "github.com/voxgig-sdk/xkcd-comics-sdk/utility"
)

// Type aliases preserve external API.
type XkcdComicsSDK = core.XkcdComicsSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type XkcdComicsEntity = core.XkcdComicsEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type XkcdComicsError = core.XkcdComicsError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewInfo0EntityFunc = func(client *core.XkcdComicsSDK, entopts map[string]any) core.XkcdComicsEntity {
		return entity.NewInfo0Entity(client, entopts)
	}
}

// Constructor re-exports.
var NewXkcdComicsSDK = core.NewXkcdComicsSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
