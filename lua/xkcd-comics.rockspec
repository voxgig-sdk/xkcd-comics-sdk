package = "voxgig-sdk-xkcd-comics"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/xkcd-comics-sdk.git",
  tag = "lua/v0.0.1",
  dir = "xkcd-comics-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the XKCD Comics public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/xkcd-comics-sdk",
  issues_url = "https://github.com/voxgig-sdk/xkcd-comics-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "xkcd-comics" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["xkcd-comics_sdk"] = "xkcd-comics_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
