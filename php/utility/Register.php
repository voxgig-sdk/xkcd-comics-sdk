<?php
declare(strict_types=1);

// XkcdComics SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

XkcdComicsUtility::setRegistrar(function (XkcdComicsUtility $u): void {
    $u->clean = [XkcdComicsClean::class, 'call'];
    $u->done = [XkcdComicsDone::class, 'call'];
    $u->make_error = [XkcdComicsMakeError::class, 'call'];
    $u->feature_add = [XkcdComicsFeatureAdd::class, 'call'];
    $u->feature_hook = [XkcdComicsFeatureHook::class, 'call'];
    $u->feature_init = [XkcdComicsFeatureInit::class, 'call'];
    $u->fetcher = [XkcdComicsFetcher::class, 'call'];
    $u->make_fetch_def = [XkcdComicsMakeFetchDef::class, 'call'];
    $u->make_context = [XkcdComicsMakeContext::class, 'call'];
    $u->make_options = [XkcdComicsMakeOptions::class, 'call'];
    $u->make_request = [XkcdComicsMakeRequest::class, 'call'];
    $u->make_response = [XkcdComicsMakeResponse::class, 'call'];
    $u->make_result = [XkcdComicsMakeResult::class, 'call'];
    $u->make_point = [XkcdComicsMakePoint::class, 'call'];
    $u->make_spec = [XkcdComicsMakeSpec::class, 'call'];
    $u->make_url = [XkcdComicsMakeUrl::class, 'call'];
    $u->param = [XkcdComicsParam::class, 'call'];
    $u->prepare_auth = [XkcdComicsPrepareAuth::class, 'call'];
    $u->prepare_body = [XkcdComicsPrepareBody::class, 'call'];
    $u->prepare_headers = [XkcdComicsPrepareHeaders::class, 'call'];
    $u->prepare_method = [XkcdComicsPrepareMethod::class, 'call'];
    $u->prepare_params = [XkcdComicsPrepareParams::class, 'call'];
    $u->prepare_path = [XkcdComicsPreparePath::class, 'call'];
    $u->prepare_query = [XkcdComicsPrepareQuery::class, 'call'];
    $u->result_basic = [XkcdComicsResultBasic::class, 'call'];
    $u->result_body = [XkcdComicsResultBody::class, 'call'];
    $u->result_headers = [XkcdComicsResultHeaders::class, 'call'];
    $u->transform_request = [XkcdComicsTransformRequest::class, 'call'];
    $u->transform_response = [XkcdComicsTransformResponse::class, 'call'];
});
