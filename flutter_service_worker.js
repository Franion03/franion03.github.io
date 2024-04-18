'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"manifest.json": "c82412f04c189cac949fd1dfbf98babc",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"index.html": "7c5d19eb1bd15fdfbb60d49a1b20c556",
"/": "7c5d19eb1bd15fdfbb60d49a1b20c556",
"flutter_bootstrap.js": "4fadc1987b1d5b79edca00623e19d6c0",
"assets/FontManifest.json": "71d21cf70608a928b8abded3599319ed",
"assets/AssetManifest.bin": "5f192a96814b19e7dd508fd73ba5a24a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "4ef9893efa01cfda3949bb8a030ea494",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "b5ccecc94516ddc8c07b60203a2e777c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "70dd6d54de430356320628eb36130059",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "6aedf53df5d9375fced4f176eeaaf483",
"assets/assets/fonts/Agustina.ttf": "dc2e22aeb9024b30a058c690a7f9f7ba",
"assets/assets/images/one.png": "639b46572c65cb20a456e318233cceff",
"assets/assets/images/two.png": "c9326110016f566fbc06a2d5042f5968",
"assets/assets/images/image.png": "9fb5704e719f93940bba93d69ebbd5cb",
"assets/assets/images/four.png": "9924c7cb3611d9d8d906a4acf0472adb",
"assets/assets/images/school.png": "88178f1132cdc68c834aa369773867ce",
"assets/assets/images/narayana.png": "20d126aba0233c917af7ae88a01c2ec7",
"assets/assets/images/gitam.png": "2119eb0402a246f446fff808da346f4a",
"assets/assets/images/three.png": "60f36898a2b193b0a468c6f19368aa7f",
"assets/assets/icons/behance.svg": "35ad2d47e647d0b168e7707b2984c6b5",
"assets/assets/icons/github.svg": "9226aa209923e38c0a6ddcb236e2bc68",
"assets/assets/icons/twitter.svg": "a4a0163fef48a4247a305528c07bc4fa",
"assets/assets/icons/flutter.png": "1105c9a994c1a6638daed558d5b631fd",
"assets/assets/icons/bloc.png": "977fbfba561065f9a68c4b47f9774531",
"assets/assets/icons/download.svg": "628700a3031424d215a441fab2da1731",
"assets/assets/icons/linkedin.svg": "5b2195ddf9e879047dd8a163c4194920",
"assets/assets/icons/check.svg": "4220c82511cc1dfb40b8bba7d25c5f55",
"assets/assets/icons/firebase.png": "36170822afe4c716cfbdb96dac8cd10e",
"assets/assets/icons/dribble.svg": "d392567c5678d42472d2c7b766268101",
"assets/assets/icons/dart.png": "1ab71d33e7ba834836197b4fa8726da0",
"assets/AssetManifest.bin.json": "511f94df4bb251f77902f7ff651166f2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "5ae5eb1671cf1816d7b46be86bc18086",
"assets/fonts/MaterialIcons-Regular.otf": "fd9d891cc7e4f16e1cc452d95653e49e",
"assets/AssetManifest.json": "16e1d6ff95ee4692846b6e40d1a4efc1",
"main.dart.js": "4a6245d8ea2c8537785e8ba6c29b63f3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"public/index.html": "6d5a046f13596fb4dc6124ae33a72396",
"version.json": "980f201b417bfddb3ad7620282f62148",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"};
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
