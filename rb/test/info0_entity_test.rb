# Info0 entity test

require "minitest/autorun"
require "json"
require_relative "../XkcdComics_sdk"
require_relative "runner"

class Info0EntityTest < Minitest::Test
  def test_create_instance
    testsdk = XkcdComicsSDK.test(nil, nil)
    ent = testsdk.Info0(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = info0_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "info0." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set XKCDCOMICS_TEST_INFO__ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    info0_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.info0")))
    info0_ref01_data = nil
    if info0_ref01_data_raw.length > 0
      info0_ref01_data = Helpers.to_map(info0_ref01_data_raw[0][1])
    end

    # LOAD
    info0_ref01_ent = client.Info0(nil)
    info0_ref01_match_dt0 = {}
    info0_ref01_data_dt0_loaded = info0_ref01_ent.load(info0_ref01_match_dt0, nil)
    assert !info0_ref01_data_dt0_loaded.nil?

  end
end

def info0_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "info0", "Info0TestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = XkcdComicsSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["info001", "info002", "info003"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["XKCDCOMICS_TEST_INFO__ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "XKCDCOMICS_TEST_INFO__ENTID" => idmap,
    "XKCDCOMICS_TEST_LIVE" => "FALSE",
    "XKCDCOMICS_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["XKCDCOMICS_TEST_INFO__ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["XKCDCOMICS_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = XkcdComicsSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["XKCDCOMICS_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["XKCDCOMICS_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
