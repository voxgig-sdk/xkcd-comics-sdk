# XkcdComics SDK utility: make_context

from core.context import XkcdComicsContext


def make_context_util(ctxmap, basectx):
    return XkcdComicsContext(ctxmap, basectx)
