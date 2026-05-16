<?php
declare(strict_types=1);

// XkcdComics SDK exists test

require_once __DIR__ . '/../xkcdcomics_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = XkcdComicsSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
