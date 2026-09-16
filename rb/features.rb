# XkcdComics SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module XkcdComicsFeatures
  def self.make_feature(name)
    case name
    when "base"
      XkcdComicsBaseFeature.new
    when "ratelimit"
      XkcdComicsRatelimitFeature.new
    when "retry"
      XkcdComicsRetryFeature.new
    when "test"
      XkcdComicsTestFeature.new
    when "timeout"
      XkcdComicsTimeoutFeature.new
    else
      XkcdComicsBaseFeature.new
    end
  end
end
