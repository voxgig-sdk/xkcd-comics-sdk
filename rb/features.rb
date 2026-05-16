# XkcdComics SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module XkcdComicsFeatures
  def self.make_feature(name)
    case name
    when "base"
      XkcdComicsBaseFeature.new
    when "test"
      XkcdComicsTestFeature.new
    else
      XkcdComicsBaseFeature.new
    end
  end
end
