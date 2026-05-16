# XkcdComics SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

XkcdComicsUtility.registrar = ->(u) {
  u.clean = XkcdComicsUtilities::Clean
  u.done = XkcdComicsUtilities::Done
  u.make_error = XkcdComicsUtilities::MakeError
  u.feature_add = XkcdComicsUtilities::FeatureAdd
  u.feature_hook = XkcdComicsUtilities::FeatureHook
  u.feature_init = XkcdComicsUtilities::FeatureInit
  u.fetcher = XkcdComicsUtilities::Fetcher
  u.make_fetch_def = XkcdComicsUtilities::MakeFetchDef
  u.make_context = XkcdComicsUtilities::MakeContext
  u.make_options = XkcdComicsUtilities::MakeOptions
  u.make_request = XkcdComicsUtilities::MakeRequest
  u.make_response = XkcdComicsUtilities::MakeResponse
  u.make_result = XkcdComicsUtilities::MakeResult
  u.make_point = XkcdComicsUtilities::MakePoint
  u.make_spec = XkcdComicsUtilities::MakeSpec
  u.make_url = XkcdComicsUtilities::MakeUrl
  u.param = XkcdComicsUtilities::Param
  u.prepare_auth = XkcdComicsUtilities::PrepareAuth
  u.prepare_body = XkcdComicsUtilities::PrepareBody
  u.prepare_headers = XkcdComicsUtilities::PrepareHeaders
  u.prepare_method = XkcdComicsUtilities::PrepareMethod
  u.prepare_params = XkcdComicsUtilities::PrepareParams
  u.prepare_path = XkcdComicsUtilities::PreparePath
  u.prepare_query = XkcdComicsUtilities::PrepareQuery
  u.result_basic = XkcdComicsUtilities::ResultBasic
  u.result_body = XkcdComicsUtilities::ResultBody
  u.result_headers = XkcdComicsUtilities::ResultHeaders
  u.transform_request = XkcdComicsUtilities::TransformRequest
  u.transform_response = XkcdComicsUtilities::TransformResponse
}
