-- Info0 entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("xkcd-comics_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("Info0Entity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:Info0(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = info0_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"load"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "info0." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set XKCDCOMICS_TEST_INFO__ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- Bootstrap entity data from existing test data.
    local info0_ref01_data_raw = vs.items(helpers.to_map(
      vs.getpath(setup.data, "existing.info0")))
    local info0_ref01_data = nil
    if #info0_ref01_data_raw > 0 then
      info0_ref01_data = helpers.to_map(info0_ref01_data_raw[1][2])
    end

    -- LOAD
    local info0_ref01_ent = client:Info0(nil)
    local info0_ref01_match_dt0 = {}
    local info0_ref01_data_dt0_loaded, err = info0_ref01_ent:load(info0_ref01_match_dt0, nil)
    assert.is_nil(err)
    assert.is_not_nil(info0_ref01_data_dt0_loaded)

  end)
end)

function info0_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/info0/Info0TestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read info0 test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "info001", "info002", "info003" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("XKCDCOMICS_TEST_INFO__ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["XKCDCOMICS_TEST_INFO__ENTID"] = idmap,
    ["XKCDCOMICS_TEST_LIVE"] = "FALSE",
    ["XKCDCOMICS_TEST_EXPLAIN"] = "FALSE",
    ["XKCDCOMICS_APIKEY"] = "NONE",
  })

  local idmap_resolved = helpers.to_map(
    env["XKCDCOMICS_TEST_INFO__ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["XKCDCOMICS_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
        apikey = env["XKCDCOMICS_APIKEY"],
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["XKCDCOMICS_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["XKCDCOMICS_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
