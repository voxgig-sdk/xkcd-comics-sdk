

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { XkcdComicsSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('Info0Entity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when XKCD_COMICS_TEST_LIVE=TRUE.
  afterEach(liveDelay('XKCD_COMICS_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = XkcdComicsSDK.test()
    const ent = testsdk.Info0()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.XKCD_COMICS_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'info0.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"alt","req":false,"short":"Alt text / hover text for the comic","type":"`$STRING`","index$":0},{"active":true,"name":"day","req":true,"short":"Day of the month the comic was published","type":"`$STRING`","index$":1},{"active":true,"format":"uri","name":"img","req":true,"short":"URL to the comic image","type":"`$STRING`","index$":2},{"active":true,"name":"link","req":false,"short":"Link to related content (often empty)","type":"`$STRING`","index$":3},{"active":true,"name":"month","req":true,"short":"Month the comic was published","type":"`$STRING`","index$":4},{"active":true,"name":"news","req":false,"short":"News or announcements (often empty)","type":"`$STRING`","index$":5},{"active":true,"name":"num","req":true,"short":"Comic number/ID","type":"`$INTEGER`","index$":6},{"active":true,"name":"safe_title","req":false,"short":"URL-safe version of the comic title","type":"`$STRING`","index$":7},{"active":true,"name":"title","req":true,"short":"Title of the comic","type":"`$STRING`","index$":8},{"active":true,"name":"transcript","req":false,"short":"Text transcript of the comic (when available)","type":"`$STRING`","index$":9},{"active":true,"name":"year","req":true,"short":"Year the comic was published","type":"`$STRING`","index$":10}],"name":"info0","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"example":614,"kind":"param","name":"comic_id","orig":"comic_id","reqd":true,"type":"`$INTEGER`","index$":0}]},"contract":{"id":"GET /{comic_id}/info.0.json","json":"{\"operationId\":\"getComicById\",\"parameters\":[{\"description\":\"The ID number of the comic to fetch\",\"in\":\"path\",\"name\":\"comic_id\",\"required\":true,\"schema\":{\"example\":614,\"minimum\":1,\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"alt\":\"If you don't have an extension cord I can get that too.  Because we're friends!  Right?\",\"day\":\"25\",\"img\":\"https://imgs.xkcd.com/comics/woodpecker.png\",\"link\":\"\",\"month\":\"9\",\"news\":\"\",\"num\":614,\"safe_title\":\"Woodpecker\",\"title\":\"Woodpecker\",\"transcript\":\"[[A man with a beret and a woman are standing on a boardwalk, leaning on a handrail.]]\\nMan: A woodpecker!\\n<<Pop pop pop>>\\nWoman: Yup.\\n\\n[[The woodpecker is banging its head against a tree.]]\\nWoman: He hatched about this time last year.\\n<<Pop pop pop pop>>\\n\\n[[The woman walks away.  The man is still looking at the woodpecker.]]\\nMan: ... woodpecker?\\nMan: It's your birthday!\\n\\nMan: Did you know?\\n\\nMan: Did... did nobody tell you?\\n\\n[[The man stands, looking.]]\\n\\n[[The man walks away.]]\\n\\n[[There is a tree.]]\\n\\n[[The man approaches the tree with a present in a box, tied up with a ribbon.]]\\n\\n[[The man sets the present down at the base of the tree and looks up.]]\\n\\n[[The man walks away.]]\\n\\n[[The present sits at the bottom of the tree as the sun sets.]]\\n\\n{{Title text: If you don't have an extension cord I can get that too.  Because we're friends!  Right?}}\",\"year\":\"2009\"},\"schema\":{\"description\":\"XKCD comic metadata and content\",\"properties\":{\"alt\":{\"description\":\"Alt text / hover text for the comic\",\"type\":\"string\"},\"day\":{\"description\":\"Day of the month the comic was published\",\"type\":\"string\"},\"img\":{\"description\":\"URL to the comic image\",\"format\":\"uri\",\"type\":\"string\"},\"link\":{\"description\":\"Link to related content (often empty)\",\"type\":\"string\"},\"month\":{\"description\":\"Month the comic was published\",\"type\":\"string\"},\"news\":{\"description\":\"News or announcements (often empty)\",\"type\":\"string\"},\"num\":{\"description\":\"Comic number/ID\",\"type\":\"integer\"},\"safe_title\":{\"description\":\"URL-safe version of the comic title\",\"type\":\"string\"},\"title\":{\"description\":\"Title of the comic\",\"type\":\"string\"},\"transcript\":{\"description\":\"Text transcript of the comic (when available)\",\"type\":\"string\"},\"year\":{\"description\":\"Year the comic was published\",\"type\":\"string\"}},\"required\":[\"month\",\"num\",\"year\",\"title\",\"img\",\"day\"],\"type\":\"object\"}}},\"description\":\"Successful response with comic data\"},\"404\":{\"description\":\"Comic not found\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/{comic_id}/info.0.json","segments":[{"var":"comic_id"},{"lit":"info.0.json"}],"select":{"exist":["comic_id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{},"contract":{"id":"GET /info.0.json","json":"{\"operationId\":\"getCurrentComic\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"example\":{\"alt\":\"This is the graph that's seared into my mind.\",\"day\":\"1\",\"img\":\"https://imgs.xkcd.com/comics/global_temperature_over_my_lifetime.png\",\"link\":\"\",\"month\":\"3\",\"news\":\"\",\"num\":2500,\"safe_title\":\"Global Temperature Over My Lifetime\",\"title\":\"Global Temperature Over My Lifetime\",\"transcript\":\"\",\"year\":\"2021\"},\"schema\":{\"description\":\"XKCD comic metadata and content\",\"properties\":{\"alt\":{\"description\":\"Alt text / hover text for the comic\",\"type\":\"string\"},\"day\":{\"description\":\"Day of the month the comic was published\",\"type\":\"string\"},\"img\":{\"description\":\"URL to the comic image\",\"format\":\"uri\",\"type\":\"string\"},\"link\":{\"description\":\"Link to related content (often empty)\",\"type\":\"string\"},\"month\":{\"description\":\"Month the comic was published\",\"type\":\"string\"},\"news\":{\"description\":\"News or announcements (often empty)\",\"type\":\"string\"},\"num\":{\"description\":\"Comic number/ID\",\"type\":\"integer\"},\"safe_title\":{\"description\":\"URL-safe version of the comic title\",\"type\":\"string\"},\"title\":{\"description\":\"Title of the comic\",\"type\":\"string\"},\"transcript\":{\"description\":\"Text transcript of the comic (when available)\",\"type\":\"string\"},\"year\":{\"description\":\"Year the comic was published\",\"type\":\"string\"}},\"required\":[\"month\",\"num\",\"year\",\"title\",\"img\",\"day\"],\"type\":\"object\"}}},\"description\":\"Successful response with current comic data\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/info.0.json","segments":[{"lit":"info.0.json"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"info0","name__orig":"info0","Name":"Info0","name_":"info0","name-":"info0","NAME":"INFO0","index$":0}, {"active":true,"entity":"info0","key$":"BasicInfo0Flow","kind":"basic","name":"BasicInfo0Flow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"info0_ref01","srcdatavar":"info0_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-info0_ref01"}}],"index$":0}]}, 'Info0')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let info0_ref01_data = Object.values(setup.data.existing.info0)[0] as any

    // LOAD: skipped — no entity id field and load requires path params.
    // Entity-var is declared here so later flow steps still compile.
    const info0_ref01_ent = client.Info0()


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/info0/Info0TestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = XkcdComicsSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['info001','info002','info003'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'XKCD_COMICS_TEST_INFO0_ENTID': idmap,
    'XKCD_COMICS_TEST_LIVE': 'FALSE',
    'XKCD_COMICS_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['XKCD_COMICS_TEST_INFO0_ENTID']

  const live = 'TRUE' === env.XKCD_COMICS_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['XKCD_COMICS_TEST_INFO0_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new XkcdComicsSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.XKCD_COMICS_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
