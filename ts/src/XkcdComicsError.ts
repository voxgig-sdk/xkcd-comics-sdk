
import { Context } from './Context'


class XkcdComicsError extends Error {

  isXkcdComicsError = true

  sdk = 'XkcdComics'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  XkcdComicsError
}

