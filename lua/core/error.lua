-- XkcdComics SDK error

local XkcdComicsError = {}
XkcdComicsError.__index = XkcdComicsError


function XkcdComicsError.new(code, msg, ctx)
  local self = setmetatable({}, XkcdComicsError)
  self.is_sdk_error = true
  self.sdk = "XkcdComics"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function XkcdComicsError:error()
  return self.msg
end


function XkcdComicsError:__tostring()
  return self.msg
end


return XkcdComicsError
