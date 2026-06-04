# XkcdComics SDK

Fetch XKCD webcomics and their metadata as JSON, including title, image URL, post date, and transcript

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About XKCD Comics

[XKCD](https://xkcd.com) is Randall Munroe's long-running webcomic of "romance, sarcasm, math, and language," with new strips published every Monday, Wednesday, and Friday. The site exposes a small JSON API so applications can retrieve comics and their metadata programmatically.

What you get from the API:

- The latest comic via `https://xkcd.com/info.0.json`
- Any specific comic by number via `https://xkcd.com/{num}/info.0.json`
- Metadata for each comic, including title, image URL, post date, and a transcript when one is available

The endpoints are public and unauthenticated. CORS is not enabled, so browser-based clients typically need to proxy requests through a server.

## Try it

**TypeScript**
```bash
npm install xkcd-comics
```

**Python**
```bash
pip install xkcd-comics-sdk
```

**PHP**
```bash
composer require voxgig/xkcd-comics-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/xkcd-comics-sdk/go
```

**Ruby**
```bash
gem install xkcd-comics-sdk
```

**Lua**
```bash
luarocks install xkcd-comics-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { XkcdComicsSDK } from 'xkcd-comics'

const client = new XkcdComicsSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o xkcd-comics-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "xkcd-comics": {
      "command": "/abs/path/to/xkcd-comics-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Info0** | Represents a single XKCD comic and its metadata (title, image URL, post date, alt text, transcript), retrieved from `https://xkcd.com/info.0.json` for the latest strip or `https://xkcd.com/{num}/info.0.json` for a specific comic number. | `/{comic_id}/info.0.json` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from xkcdcomics_sdk import XkcdComicsSDK

client = XkcdComicsSDK({})


# Load a specific info0
info0, err = client.Info0(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'xkcdcomics_sdk.php';

$client = new XkcdComicsSDK([]);


// Load a specific info0
[$info0, $err] = $client->Info0(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/xkcd-comics-sdk/go"

client := sdk.NewXkcdComicsSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "XkcdComics_sdk"

client = XkcdComicsSDK.new({})


# Load a specific info0
info0, err = client.Info0(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("xkcd-comics_sdk")

local client = sdk.new({})


-- Load a specific info0
local info0, err = client:Info0(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = XkcdComicsSDK.test()
const result = await client.Info0().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = XkcdComicsSDK.test(None, None)
result, err = client.Info0(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = XkcdComicsSDK::test(null, null);
[$result, $err] = $client->Info0(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Info0(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = XkcdComicsSDK.test(nil, nil)
result, err = client.Info0(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Info0(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the XKCD Comics

- Upstream: [https://xkcd.com](https://xkcd.com)
- API docs: [https://xkcd.com/json.html](https://xkcd.com/json.html)

- XKCD comics are offered under a [Creative Commons Attribution-NonCommercial 2.5 License](https://creativecommons.org/licenses/by-nc/2.5/).
- You may copy and share the comics, but you may not sell them.
- Attribution to Randall Munroe / xkcd.com is required when reusing comic content.
- The JSON endpoints themselves are public and require no authentication.

---

Generated from the XKCD Comics OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
