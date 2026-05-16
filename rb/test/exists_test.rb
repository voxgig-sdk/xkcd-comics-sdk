# XkcdComics SDK exists test

require "minitest/autorun"
require_relative "../XkcdComics_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = XkcdComicsSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
