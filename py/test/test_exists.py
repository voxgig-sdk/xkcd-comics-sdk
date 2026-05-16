# ProjectName SDK exists test

import pytest
from xkcdcomics_sdk import XkcdComicsSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = XkcdComicsSDK.test(None, None)
        assert testsdk is not None
