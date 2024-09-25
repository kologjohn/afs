'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c22d0b053de1632f7b4083f12ae4fa09",
"version.json": "0835d9b1eabec3077e3111096eee5e63",
"index.html": "8e57cc5916c18f7a150ba40b04c3c717",
"/": "8e57cc5916c18f7a150ba40b04c3c717",
"main.dart.js": "56bf1c50cdcb062f6486b6767d1ddf77",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512p.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "45946db8176d2b68216bf8e76827ad29",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512p.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/playstore.png": "4998bddc442239bb20ca8bcc788a07ee",
"icons/Icon-maskable-512.png": "cfe131c1f9bd1b03466f84de1844ffae",
"icons/Icon-192p.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "f26f9fab5f5ef9bd363d39cd452e7a1b",
"manifest.json": "55e7e5fd7259451975f6ab96b7cd60f6",
"assets/AssetManifest.json": "b4b4c71c1e4bab9e172b5aa142ba1b4f",
"assets/NOTICES": "a5cb1d66faa571d4486954e8fd9827d2",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "96ab51719471a5b93184f388e917ac24",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/country_state_city_picker/lib/assets/country.json": "11b8187fd184a2d648d6b5be8c5e9908",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "eab5dae19182fb1876f6ba7347ceda17",
"assets/fonts/MaterialIcons-Regular.otf": "64dc2dab98807a46eb2868378781e6f3",
"assets/assets/svg/icons8-linkedin.svg": "56cd35e623f956eec8651693fbe8f3ae",
"assets/assets/svg/terms.svg": "d9f1e881bf7bffb9f787d9c77b9ae0be",
"assets/assets/svg/f_logo.svg": "6912a762a309d1810ce577dc70d166c8",
"assets/assets/svg/icons8-twitter.svg": "549a94c815fb58da319d79837ecb0cc2",
"assets/assets/svg/icons8-facebook.svg": "6b446a380e308ad3d84cf955d088f3be",
"assets/assets/svg/icons8-pinterest.svg": "5baca202404f99e947b07c7acaa5eabc",
"assets/assets/svg/facebook.svg": "2234d9713e4df03a578f733d3e4d3a12",
"assets/assets/svg/pinterest.svg": "393b01bf0cf356c4e373c26aec5b1321",
"assets/assets/svg/twitterbird.svg": "64c341fa98a5b20598ee33d2a7f3d8c4",
"assets/assets/svg/glogo.svg": "881123a021ce7ca23a4442585fe94a25",
"assets/assets/svg/gh.svg": "7f196daad6acbb1a2e38e41c625aa6b9",
"assets/assets/svg/linkedin.svg": "16978f0bf7260450464a5d45830c7848",
"assets/assets/svg/twitter.svg": "4390e8f6e1342ac1700db3ded1f32492",
"assets/assets/images/visa1.png": "39358745dc86374d0764cc551b0eaa75",
"assets/assets/images/ghana.png": "f778d62bed5baacc23a541e68d94b066",
"assets/assets/images/DSC_6131.jpg": "ead8d0da488679eb5082222e978d5faa",
"assets/assets/images/payout.png": "63c4184bda7c06da6769f74285dd1780",
"assets/assets/images/reshape4.png": "3e4c0cfe4d2af096ebf45e73bcea6983",
"assets/assets/images/A8A0487.jpg": "8dc1b33301d47d3ba7ca9f115be3ad89",
"assets/assets/images/A8A0530.jpg": "5b561a1c71884064d41ab3015ffc4977",
"assets/assets/images/aboutus.png": "0e809f8c5a797a19757fc02d2d376cf3",
"assets/assets/images/reshape5.png": "51b1c32700f23bd72192a904df317695",
"assets/assets/images/reshape1.png": "28e1e1604e15ac3b582029191a8c6b69",
"assets/assets/images/reshape2.png": "8830ce2b6b4b08c46715c32b7043b674",
"assets/assets/images/bg2.jpeg": "469556179feea36f3bfbb890f9c086cf",
"assets/assets/images/shipping.jpg": "544f17d7280b478eb78e2892f80d5c90",
"assets/assets/images/reshape3.png": "8c6eaf846355c56f0f27e0a4d1ed1eed",
"assets/assets/images/heritage22.png": "163ddc2df2640f7d8222c8546f76ffd8",
"assets/assets/images/DSC_0331.png": "d67af96847a0b9604a4bc14ecc6ede16",
"assets/assets/images/afs6.jpg": "d4a87572c3efca6d39bb2d99c5c3cb11",
"assets/assets/images/heritage5.png": "154a2c00ff2b5eaa81e59a8eb139cbdf",
"assets/assets/images/DSC_6146.jpg": "d8d9130bd7144bedd386485dc75b69e4",
"assets/assets/images/MasterCard1.png": "3aa787b7e88c14bb908fdb45af71eeb0",
"assets/assets/images/Lace%2520Basket%2520.jpg": "510a5520868001a9aed44812bb9e6783",
"assets/assets/images/afs7.jpg": "011b7059c7b2b2d69bea6bf97e6315d4",
"assets/assets/images/Natural%2520Planter(1).jpg": "3c859aff39c117f68e97fe9ff94cb379",
"assets/assets/images/heritage44.png": "a57f1706cce2769765935f1a7f2d7675",
"assets/assets/images/heritage4.jpg": "06dc31a3c8b4c6cf8b1ab383fbe140fa",
"assets/assets/images/afs5.jpg": "a0e5e66d15d91f654591b8c27a865890",
"assets/assets/images/heritage6.png": "1323831d9f5c6fb8a6c694f9176081e6",
"assets/assets/images/DSC_6144.jpg": "9a1e1993547b09b0ed05e72c644f413e",
"assets/assets/images/visa.jpg": "857ae4311c6704f9cebd6da20c46d2ce",
"assets/assets/images/heritage7.png": "e782607516441471f439bb29eb72784f",
"assets/assets/images/heritage3.jpg": "3ac41bc4705dbce6c41053139c8a513f",
"assets/assets/images/Handwoven%2520Fan.jpg": "5e37732294752992187f9b44d6d5cecf",
"assets/assets/images/DSC_0242.png": "3007f5bab62b73c404560afddacd5f80",
"assets/assets/images/afs1.png": "c19f188de4e6a7f7208067347b4959ae",
"assets/assets/images/heritage2.jpg": "7c4495fca254217f4b3f49a510fabf6c",
"assets/assets/images/afs3.png": "bd130cd989b21831de213528f5caf99e",
"assets/assets/images/contact.png": "0b9b4b3e8e0fa9c5e7d59791b5aac77b",
"assets/assets/images/afs2.png": "e378456c192b7e8363a2783265a1d2d7",
"assets/assets/images/heritage1.jpg": "624792cb77af81ee78f3430812a74ea2",
"assets/assets/images/DSC_0259.png": "748a2cd35cd012572d0fdfbf62e72941",
"assets/assets/images/hats.png": "d3934c4abd4debe5a0776b001c49b83e",
"assets/assets/images/chair.png": "ddf59b9baf4156bd4d1174c3cfec2d43",
"assets/assets/images/image_0.png": "ddf59b9baf4156bd4d1174c3cfec2d43",
"assets/assets/images/afs9.jpg": "9da181ba815b80f71b017c6f3f8fda7f",
"assets/assets/images/eu.png": "afa70990aa35d1160b4dc94b8244962a",
"assets/assets/images/bg1.png": "ac1856bcae05a66f10a960ef82412f35",
"assets/assets/images/DSC_6148.jpg": "5f62e6b560fe1a16eda1e462f01b32c6",
"assets/assets/images/afs8.jpg": "8ab7b3f3cc273c4b5dab9ca2844d8450",
"assets/assets/images/headphone.png": "bf7c96b85b05e02b5cc4cbeaa926836a",
"assets/assets/images/shipping-process.png": "303e0401782900c118d21629e2301a9a",
"assets/assets/images/heritage8.png": "f8bf4004da4bb324bbf1b65675ae8a3a",
"assets/assets/images/Handwoven_Fan-removebg-preview.png": "22b86af679b50129414a1abcad313ef4",
"assets/assets/images/afs.png": "601c7614fa703f9731aa1c97bc20e393",
"assets/assets/images/af2.png": "f48153484061c45f2c9e91bbd1b629f6",
"assets/assets/images/ushape.jpg": "bca3cf06676af33a770bb231942d65f2",
"assets/assets/images/MasterCard.png": "4cbdeeedd921a89dffe72073d6e86324",
"assets/assets/images/af1.png": "23839697fbc0fe3e400b8500541d9a2d",
"assets/assets/images/whatsapp.png": "ae8fe9c8a558d06967316d1137fb4f36",
"assets/assets/images/heritage11.png": "58bf16839646b29263cf4e69b120a321",
"assets/assets/images/PayPal.png": "f66c1d3f8382fdb5d292be12c77d94ba",
"assets/assets/images/africanstrawonne.jpeg": "143aca69b56870dcf6ded35d6cc38a20",
"assets/assets/images/A8A0463.jpg": "cecd4f4a67f6c443d0a657b26e49c65d",
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
