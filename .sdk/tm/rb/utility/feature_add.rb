# XkcdComics SDK utility: feature_add
module XkcdComicsUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
