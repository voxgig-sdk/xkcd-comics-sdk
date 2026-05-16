# XkcdComics SDK utility: make_context
require_relative '../core/context'
module XkcdComicsUtilities
  MakeContext = ->(ctxmap, basectx) {
    XkcdComicsContext.new(ctxmap, basectx)
  }
end
