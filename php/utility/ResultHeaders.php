<?php
declare(strict_types=1);

// XkcdComics SDK utility: result_headers

class XkcdComicsResultHeaders
{
    public static function call(XkcdComicsContext $ctx): ?XkcdComicsResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
