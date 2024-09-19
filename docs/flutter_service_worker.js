'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "008b47b5eec84e96cdc554bd753e2eba",
"version.json": "dd27096ceec0872c90bf105e85659a59",
"index.html": "a698817a067c2ec12ae93111d8bc0f4c",
"/": "a698817a067c2ec12ae93111d8bc0f4c",
"main.dart.js": "82b2e644f17d6e2163139694cec91438",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "dee8a413ef5aac0d2944aae872fbc6d9",
"build/6c8f1bb72a1dc4dd4ca9d085429dd6f8/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
"build/6c8f1bb72a1dc4dd4ca9d085429dd6f8/gen_dart_plugin_registrant.stamp": "436d2f2faeb7041740ee3f49a985d62a",
"build/6c8f1bb72a1dc4dd4ca9d085429dd6f8/_composite.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/chrome-device/Default/PreferredApps": "2b432fef211c69c745aca86de4f8e4ab",
".dart_tool/chrome-device/Default/Visited%20Links": "74d45f1c9147579834daf06ca3348c87",
".dart_tool/chrome-device/Default/Session%20Storage/000003.log": "e3f912dfd07783622fc61f471eee50b7",
".dart_tool/chrome-device/Default/Session%20Storage/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Session%20Storage/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Session%20Storage/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Session%20Storage/LOG": "a73234c9fe1b792daace1b5ce40ad3f9",
".dart_tool/chrome-device/Default/Safe%20Browsing%20Cookies-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Reporting%20and%20NEL-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Preferences": "1de494b550ee4a3dd3df52000984afaa",
".dart_tool/chrome-device/Default/GCM%20Store/Encryption/000003.log": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/GCM%20Store/Encryption/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/GCM%20Store/Encryption/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/GCM%20Store/Encryption/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/GCM%20Store/Encryption/LOG": "ee4e1ca26282ba842fcfabf8c0fa3903",
".dart_tool/chrome-device/Default/heavy_ad_intervention_opt_out.db-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/chrome_cart_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/chrome_cart_db/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Shortcuts-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/WebStorage/QuotaManager-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/WebStorage/QuotaManager": "998bd65b1c2cd6b1ee2cfdb5184a4fee",
".dart_tool/chrome-device/Default/Favicons": "39594766923acd772ab10fbcb294d920",
".dart_tool/chrome-device/Default/AutofillStrikeDatabase/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/AutofillStrikeDatabase/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/DIPS": "856780d518ff1a5f7ccc66ad6dda6308",
".dart_tool/chrome-device/Default/Site%20Characteristics%20Database/000003.log": "74ef97a16dc65cfd2255e70597c10ba8",
".dart_tool/chrome-device/Default/Site%20Characteristics%20Database/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Site%20Characteristics%20Database/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Site%20Characteristics%20Database/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Site%20Characteristics%20Database/LOG": "eee09ae8d2efdf24048e71ed7edaaebc",
".dart_tool/chrome-device/Default/Web%20Data": "427e2786af49b24b9f724c540ca42e66",
".dart_tool/chrome-device/Default/heavy_ad_intervention_opt_out.db": "56b9706a81a233edfa726b351e150636",
".dart_tool/chrome-device/Default/Login%20Data": "cd6917cc36422aed5e2a20a1132943db",
".dart_tool/chrome-device/Default/Favicons-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/trusted_vault.pb": "3433ccf3e03fc35b634cd0627833b0ad",
".dart_tool/chrome-device/Default/PersistentOriginTrials/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/PersistentOriginTrials/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Extension%20Scripts/000003.log": "cc4a8cff19abf3dd35d63cff1503aa5f",
".dart_tool/chrome-device/Default/Extension%20Scripts/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Extension%20Scripts/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Extension%20Scripts/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Extension%20Scripts/LOG": "52dd372dbd6609a16a06c3967b0bee40",
".dart_tool/chrome-device/Default/Extension%20Rules/000003.log": "cc4a8cff19abf3dd35d63cff1503aa5f",
".dart_tool/chrome-device/Default/Extension%20Rules/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Extension%20Rules/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Extension%20Rules/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Extension%20Rules/LOG": "aa9e4ce794cdfcb1a6583c1cb70f84f9",
".dart_tool/chrome-device/Default/coupon_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/coupon_db/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Reporting%20and%20NEL": "791d6464ee36343ee7a655f64f1cc2b5",
".dart_tool/chrome-device/Default/Download%20Service/EntryDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Download%20Service/EntryDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Affiliation%20Database-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/BrowsingTopicsSiteData-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Network%20Action%20Predictor-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Service%20Worker/Database/000003.log": "3fe352f788afdfcee4aa0bcc6b3c2451",
".dart_tool/chrome-device/Default/Service%20Worker/Database/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Service%20Worker/Database/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Service%20Worker/Database/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Service%20Worker/Database/LOG": "7b05073cd03294e6727b8019ab7a7055",
".dart_tool/chrome-device/Default/Service%20Worker/ScriptCache/index-dir/the-real-index": "7aecdb5d819230909e17c99d3e2462f6",
".dart_tool/chrome-device/Default/Service%20Worker/ScriptCache/index": "54cb446f628b2ea4a5bce5769910512e",
".dart_tool/chrome-device/Default/Service%20Worker/ScriptCache/2cc80dabc69f58b6_0": "3294d5082822a4c36a4076b3486050ac",
".dart_tool/chrome-device/Default/TransportSecurity": "460b9abbb37226edfcdf1d3e0ac77590",
".dart_tool/chrome-device/Default/Network%20Action%20Predictor": "ebbbb297c4628bf5e0ca978fbf51d28b",
".dart_tool/chrome-device/Default/Safe%20Browsing%20Cookies": "e58e2c64b8c2fe54ae61d1b7e505bc73",
".dart_tool/chrome-device/Default/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/History-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/SharedStorage": "b016510815cfc2bcd2e04d07a0d4cf80",
".dart_tool/chrome-device/Default/discounts_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/discounts_db/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Feature%20Engagement%20Tracker/EventDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Feature%20Engagement%20Tracker/EventDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Feature%20Engagement%20Tracker/AvailabilityDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Feature%20Engagement%20Tracker/AvailabilityDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/README": "883d62acd72005f3ad7a14500d482033",
".dart_tool/chrome-device/Default/Shared%20Dictionary/cache/index-dir/the-real-index": "ad9a8a518c774c0357684d080cee8618",
".dart_tool/chrome-device/Default/Shared%20Dictionary/cache/index": "54cb446f628b2ea4a5bce5769910512e",
".dart_tool/chrome-device/Default/Shared%20Dictionary/db-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Shared%20Dictionary/db": "358d089087aa109e41f38ddda1ff8368",
".dart_tool/chrome-device/Default/Extension%20State/000003.log": "af1d95e1f9eb485393273b25446e1ae5",
".dart_tool/chrome-device/Default/Extension%20State/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Extension%20State/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Extension%20State/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Extension%20State/LOG": "0cfc124980ea67b9c07186b99126bc26",
".dart_tool/chrome-device/Default/Login%20Data%20For%20Account-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/commerce_subscription_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/commerce_subscription_db/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Network%20Persistent%20State": "cdb99f69574881fa4786d67cfe59cc34",
".dart_tool/chrome-device/Default/BudgetDatabase/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/BudgetDatabase/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/BrowsingTopicsSiteData": "8c1ac221f2f20f7e7fb1b0d1e7fefae9",
".dart_tool/chrome-device/Default/Sessions/Session_13371176773342529": "342c1b2673241a9a843ca8b332adee62",
".dart_tool/chrome-device/Default/Sessions/Tabs_13371177048616620": "eb6d260e930df8959bc3ae382484c50a",
".dart_tool/chrome-device/Default/optimization_guide_hint_cache_store/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/optimization_guide_hint_cache_store/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Affiliation%20Database": "3a5a1b5681601d04c79f16f740244039",
".dart_tool/chrome-device/Default/shared_proto_db/000003.log": "4608bd19bd8207360b770e581a6f264d",
".dart_tool/chrome-device/Default/shared_proto_db/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/shared_proto_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/shared_proto_db/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/shared_proto_db/LOG": "ef02167861989971f5ec060820469d1a",
".dart_tool/chrome-device/Default/shared_proto_db/metadata/000003.log": "a1d98188bf8fa14fd26bc49d5018e7cc",
".dart_tool/chrome-device/Default/shared_proto_db/metadata/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/shared_proto_db/metadata/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/shared_proto_db/metadata/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/shared_proto_db/metadata/LOG": "8641abad9935327ba1e3d63e9fd0b286",
".dart_tool/chrome-device/Default/BrowsingTopicsState": "45ae3b8e07cbcf8a9da26ff12f4b4b7e",
".dart_tool/chrome-device/Default/History": "a111d9d162277bbc08eb88b467a24d40",
".dart_tool/chrome-device/Default/Shortcuts": "d08e89c67b96f8b4c69549952f40d807",
".dart_tool/chrome-device/Default/Secure%20Preferences": "727195b04a60e5f300a2136cb522001b",
".dart_tool/chrome-device/Default/Trust%20Tokens-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Login%20Data%20For%20Account": "cd6917cc36422aed5e2a20a1132943db",
".dart_tool/chrome-device/Default/Trust%20Tokens": "ba18bf06e5b76061522cdef07791ab8d",
".dart_tool/chrome-device/Default/Sync%20Data/LevelDB/000003.log": "b14764cd1bc1aa64a1f0551cd3682b81",
".dart_tool/chrome-device/Default/Sync%20Data/LevelDB/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Sync%20Data/LevelDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Sync%20Data/LevelDB/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Sync%20Data/LevelDB/LOG": "b6b4b732be71cba488083252e120b09a",
".dart_tool/chrome-device/Default/Web%20Data-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Top%20Sites-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/ClientCertificates/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/ClientCertificates/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/DIPS-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Top%20Sites": "a2ac786a14ba0aa6193172a7e0fc2b24",
".dart_tool/chrome-device/Default/Login%20Data-journal": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Local%20Storage/leveldb/000003.log": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Local%20Storage/leveldb/MANIFEST-000001": "5af87dfd673ba2115e2fcf5cfdb727ab",
".dart_tool/chrome-device/Default/Local%20Storage/leveldb/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Local%20Storage/leveldb/CURRENT": "46295cac801e5d4857d09837238a6394",
".dart_tool/chrome-device/Default/Local%20Storage/leveldb/LOG": "de0fe377660436ba5c6bf4d116b4b9d7",
".dart_tool/chrome-device/Default/Cookies": "e58e2c64b8c2fe54ae61d1b7e505bc73",
".dart_tool/chrome-device/Default/parcel_tracking_db/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/parcel_tracking_db/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SegmentInfoDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SegmentInfoDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SignalStorageConfigDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SignalStorageConfigDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SignalDB/LOCK": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Segmentation%20Platform/SignalDB/LOG": "d41d8cd98f00b204e9800998ecf8427e",
".dart_tool/chrome-device/Default/Cookies-journal": "d41d8cd98f00b204e9800998ecf8427e",
"assets/AssetManifest.json": "5db9105fac71a21c20ac77a088c50d94",
"assets/NOTICES": "2641520ebadd5c71d2df8a19457d2b8f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "cb090ad192c502a15da798a331a9860b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "634d94844ea9caa2bd32144eb13d3728",
"assets/fonts/MaterialIcons-Regular.otf": "8ea08ea2444cc58ec5807fd7669e488f",
"assets/assets/locales/pt.json": "5218ee644fec02b74427c0254e8d115e",
"assets/assets/locales/en.json": "5218ee644fec02b74427c0254e8d115e",
"assets/assets/images/elite2.png": "6c4b4fe62b06d148dd9216269dbb8810",
"assets/assets/images/elite.png": "055ec439de949eaa057f0386eab9efb0",
"assets/assets/images/scaled.png": "e11529c5c50ed18a28853f1da5a987e8",
"assets/assets/images/rx.png": "ba75997afb33f6bed66420f8bb6924d1",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
