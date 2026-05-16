<?php
declare(strict_types=1);

// XkcdComics SDK utility: result_body

class XkcdComicsResultBody
{
    public static function call(XkcdComicsContext $ctx): ?XkcdComicsResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
