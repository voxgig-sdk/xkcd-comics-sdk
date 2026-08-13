# XkcdComics SDK feature factory

from xkcdcomics_sdk.feature.base_feature import XkcdComicsBaseFeature
from xkcdcomics_sdk.feature.test_feature import XkcdComicsTestFeature


def _make_feature(name):
    features = {
        "base": lambda: XkcdComicsBaseFeature(),
        "test": lambda: XkcdComicsTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
