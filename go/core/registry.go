package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewInfo0EntityFunc func(client *XkcdComicsSDK, entopts map[string]any) XkcdComicsEntity

