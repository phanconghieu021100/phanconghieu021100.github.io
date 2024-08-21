'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "cdfe66d2bc1cdeba65de1bac35301007",
".git/config": "b46621c629fe4dcae42ca7478d208716",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "9e7d2540bad3b1a187e05b3cfba4a7c9",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "fb28915559a8fcc80f72c26c976e9a44",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "874fe108a009aeb3e6f1fb481bedfe21",
".git/logs/refs/heads/main": "5bce4ab72cb17351c0d052c60a9b4ab6",
".git/logs/refs/heads/update/1908": "74e94d22f5e65b184bfad9b85980a727",
".git/logs/refs/remotes/origin/main": "5a95520e9018fd4173068730e3ff31f0",
".git/logs/refs/remotes/origin/update/1908": "44cd015a2f38a08a19be9ca3754d8c2f",
".git/objects/02/8c630d641011d3510691dea4793aa425e3c033": "9cc6800e9a3a8b871a97ce7c48097610",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/08/2ed976f59958536d2a9d146db564ac7bc5afb5": "1cb7f0f70fab3fa331914dcc641c30af",
".git/objects/09/6b3af34bb7008c450ac1fee0555775aa7504f4": "59de83b4df7a646fd6e1beeba65b1e39",
".git/objects/0d/9642bad46aaa206450bba4503e4357308608d3": "a1a65e2b8c7524870fb38c62b24a6803",
".git/objects/0f/c344c7e8b9e32ea1ad91f30ded22556352d7bf": "a8a30f28869f7378465338066f34d80d",
".git/objects/11/96c025dd0c52d88ed52614e09840cb87ea7225": "cd83e30911622655a5cd741a0b2cd6f7",
".git/objects/16/528abc1f75f405cc53ec2516ee05d02b45d3ef": "93050452814c0ca57408a93f36b976c0",
".git/objects/16/5da67191b73406e15fc3e6cf7cda3c195dc735": "86cfac30d97fb45bba2f4417782645d6",
".git/objects/16/c8c3b7720f5671914688ecc2e655b23462618e": "532d337d104058822ef482b132baded5",
".git/objects/18/cddb9ae3a69b20a84aa647ce7d9b1c83f29f61": "f91e6521e482bf0bcbf0b54617020140",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/19/c9c03b45bd0e01f61ce323670b02c864e69081": "48e8f3fdb77bbe40aed6ab5f08c1cd7d",
".git/objects/1d/90d5df15addd343fca125b4bf0dcf269745543": "2ef59161d202fd2e5843f0f50d7d8cb8",
".git/objects/1e/25fb4841dbfcbc6e4fa75d9417a4113ba250bc": "e91280155bc02e320c2a664e7fefc7b5",
".git/objects/1e/f77e2c9ff4696bcb22cf4c0cde42775598cded": "613efe84d93c5991561ea68e6eb15dc3",
".git/objects/1f/33d92b4d06f8e4ed2fb0e55c816e2028373553": "75e4f09a115dcbbe6bbdd101295a8a23",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/22/f3597156042ae583010263e1b95e4f266da017": "0e450a3bd98d6303ee3975c13ca2f9da",
".git/objects/25/35a649160e2bec8472389c789751a4613d32d1": "37ed28e8ede0c4890a22eb75896a6284",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/28/408b6400db2b73d9d39890a458529873713c47": "6541a12e807d3310844e9c27a95a24c6",
".git/objects/2b/c6dec109696e3c46d19360ef1017a411affb68": "2b9a02853f7f9e480807c299912fe3bf",
".git/objects/2c/9ec142f9761957ff575da2b30660c1bf9441e3": "927ae85c2b98b4265615ebde0949c913",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/33/5745a1fdbc0ee60af168cf95dfeb9b7160e6d6": "46afcba66bbbe4b136a6747929460c57",
".git/objects/39/6f83e4e1b6e77ab8f1e0e0252cad6956633f14": "9f6e57bdcc25320e18bd65de7a2a865c",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3a/b527dff36b5a3cc443bbeae48e4c87da7d5d40": "c1822384fbb16d7d1ef62feac4d36ee0",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/42/fb81ba27e0eacadb90e21c612be9824ae425de": "61e81f2c0b74360f7320d083bafde0ac",
".git/objects/43/0558355a35e5838b4c832cef7264795b60a5ef": "c080297113dfd85a3c7240d69fc47e8c",
".git/objects/46/190e3dea02f67be4e50a33b4d561fcb1497005": "42a1bf4895196bfd743e1e64d3484ace",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/47/04fb79ac3b17cee108f92d40e1674ac3e04829": "be0ce0c7eeb53d7ad2cf0884dc715867",
".git/objects/47/c443eae736e11ed64463d212f835cb577d5d67": "71e96a6c53d6293ceb344b87babc6d64",
".git/objects/47/db31ddf2d9023e8a5d5badadd0673b13dfe50f": "038eaf9d37b3e77f76c427ad0ea32f60",
".git/objects/48/fceae48b62f568f93267dd15cf6ec3f9d77cfe": "524e349e67025d21365f098b10bfb306",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/4a/50a365ed45fb9cadb2c9f1a1a7eb3ab7a98962": "391175a6aa78347037d831476e3a2df8",
".git/objects/4a/94133e5f7ee97825badabb18321bcf9d263750": "9eb2463ae1baa09714b37d3d7c2d7e40",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/4d/4e21a4f55c0fc59f9c71a6595a857eeb3f5ac5": "02f001a030ee04b33ae63dd30f9e455e",
".git/objects/4d/ebcb331f2403647ffd51f26193d195bd859a17": "f3d1bc7f4ebbf659e74241a49db0ee7d",
".git/objects/56/feddb0c5675f3d696a17a14d6caf12d198d34f": "3c0f4f5cecd6ce9fe2a30edd378e5f10",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/5d/15fadf1864d70c7184fca7d3efde79cdf68af5": "79a44d8578cc18e3add64aa6a97f0da0",
".git/objects/62/c89ee094658c7a9465824fdb42793a64ea557b": "133cd5da638f245b079d9e9cdc29ae38",
".git/objects/64/9ef0b941ec780e3693c100bdb3ec272162ce98": "6080c23d5c98dfaf1d39649912ef7150",
".git/objects/69/dd618354fa4dade8a26e0fd18f5e87dd079236": "8cc17911af57a5f6dc0b9ee255bb1a93",
".git/objects/6a/63b25c7a5d7cbc7f3a4e15b50456eff8a61207": "94dfc72f7c718cad89630ced7849d815",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/6c/982e657e9fb79a779d7c34492b3680718747a9": "dee0f6220efa5c41ddfa4903956c6e93",
".git/objects/70/4dc90c1df94a5880c43dc36cbb57fcbef08c85": "a2ffbfc7416e5338a9147091a4218640",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/72/01c8297b50268cfa586a1942a0ad75c9813e5f": "0bf0bbdca42d0572163efadfb02a9e9a",
".git/objects/72/97ea18f4ef896c8e9bc1fad3a200937a407e2d": "a7238b87549364a0408056ed896b9bf0",
".git/objects/73/7b60084c7f2519e6f0ad482e9b6e156d9122f0": "73024af3fce15c72af37f035fd1779f5",
".git/objects/75/377e040c7689d8c090056f896ebe78a72e6add": "663c59672b40bc151c106050bb987543",
".git/objects/76/4a58b8c271e75940f4d29cb8f77ba57fcbe0e4": "35b330a44103740c86198958ff780184",
".git/objects/76/7e4be1fd615adf3768bb58c7d099179be5022d": "a97ae989b5f51896c6cd61fb80d6f1c6",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/7d/1f0f4798df33548b6579485bcae54ea8e28baf": "8f27805702ba2e175dd37c62eafa75c3",
".git/objects/83/ccd3df0175ab6d8be26cb6e42d599b5081c4fc": "75129081002040f3dc04dd0defa3bd7c",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/84/2a226c4dffc69a0e679afde52d8f8fd877c4d2": "4d032a9c0181605061dc56984127d965",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/86/d111f09a93cccfa0011858c519a823e7dafef7": "9a15839a59b5f501fbf7b9824c4b6f84",
".git/objects/86/dba7b80263ee29ec6c38ff530daf90c0afc41e": "265b11fdc451897024219257aa3eaa7c",
".git/objects/87/0563f57d75e0c32d74b204469d80a04879fa56": "aa6c98446477adfc36e0be908593ea03",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/5307c7b2a8e9552809a65fb011569e578c8d6a": "fcc44b064edb9f16e42460c111a527ce",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/f4c05558d84050b93ab4558a0c7341b1971b98": "a1baf4b91fa52c8ca567805a608f29c2",
".git/objects/8f/368292a70675725b4d450fb31a7af7e7a2465c": "f772b016eabfd2336c517d3cfb18602d",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "e3695ae5742d7e56a9c696f82745288d",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/93/5bb79e497dfa8306acb1e5046b764031284e52": "f5a5663ee7f4243b84067f018fc347a9",
".git/objects/93/d6eaaff43211eacb03d62985a6df2e0bc3f2c9": "3211edb4b25b395769e0e146f9751a04",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/95/16ba404e5c595a465f32c248f8a2994c356f27": "521a55c2cf97a600f593e36d3aa6e744",
".git/objects/96/51235150e6e57b98de87deeb302042b7f64a3e": "20980a4f43eaea5f8238cc3279604766",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/9e/26dfeeb6e641a33dae4961196235bdb965b21b": "304148c109fef2979ed83fbc7cd0b006",
".git/objects/9f/84b79d39455b56449d5e132c2c0c76846d512c": "0fa788fbb71d873b98c37935a4bea090",
".git/objects/a0/38151b4f8f950f623e77d60276b286d92fa23b": "fab0fb3a63d35fcc7508d44529103f4b",
".git/objects/a2/c2c501d92cade4609fbff2a20d058036a0f07d": "5799cad65f96fe00122233a5625d5041",
".git/objects/a3/3ed857ee8e93194cbfa13e0881effa7381d5e8": "0a42ab7b50567ae84d4059190dfae82e",
".git/objects/a5/3efdf92300d180241adcd14d81d15a734c4e08": "cdce04155deb291d95d5b2a8a45a186e",
".git/objects/a8/f66c844f115ae2045bef21319346b25a931241": "61231c624c245722e9a9aad8b401711a",
".git/objects/a9/ba5b245ee5853c16b60b2b151aeceb0f7ba269": "5d54aa38a4f806d71fe94d8ab2fa41fe",
".git/objects/ad/6c0bedd21353d1ec40adeb8420fac39497e76a": "664fe29f9750027d3a27debd7cab99bf",
".git/objects/ad/716cf2a6e16d955c08a92ffff3121c5825a307": "5b746d63dc0e5057a985939c55cb87d2",
".git/objects/b1/5ee65888285525982f8f886ee20394e3d8bbde": "78f4a4d771e393796e12951d83e4db35",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b5/df6bd1c3ca6ba6a86a07d6a3108fae25c399d1": "609774f69067565044710fc29f6bf706",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/63f13fbde37974e38c8246cd25629d7257d27d": "dee6e92851bffb7580788ea4d4936296",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bb/8a8b38eb26fa15855063386763490ff4c6aefd": "21298c8ecf58eb77b66e90dccbed8388",
".git/objects/be/d9ee72bb27185221ea9c7972fe3cb425c93035": "9759e317cc9a70d77c7aa8698e26e6dd",
".git/objects/c0/49857f7f98da4a1cede7c6d055a3d5e7c93a41": "fee5670fccbaeee21b826b183ae89498",
".git/objects/c1/35bcd70885ce0d7bed8a171ae240f958b6e44d": "0bc56e4914d3f17d7815070be2d1e8f1",
".git/objects/c1/42e1409c9f65b7870f6be0f1ab440982b0e872": "a58365307e2b3f36c5c4665b402e7e5f",
".git/objects/c5/2b141ccd236cc19c814bd2f8334e42e7a1c53b": "f5e62ef6d31369c31a1592ef26f8863f",
".git/objects/c9/2894908047389539aba8202054756f0b950018": "f33a0d7b2a91365ced89bec1868cd942",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/c9/fb4b30521b5adf570ed4ec18a5eacd4cb97808": "35009cc4f9f42eb60b7eb79227cf6311",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/cc/f8607f3d54e02543687a787da01e6fe79cad05": "76046ac36eb3fc4289713ebf712e9cca",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d2/2ce67f51fdfc5af0f5d845346e596f6f50adaf": "baf73aa831042d45c58080084470f73a",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d9/3ab9ec9f62259c2c8231446b4f77b30edf0d2f": "b9f68d993352fc652384ad1aca7c473a",
".git/objects/dd/982fe6a5a20a0d692feebb1b6c38260c70623c": "4cbd41d904deecd016749ac708e8123b",
".git/objects/de/41c789ee310e37141968ec50418521b63b9e88": "91b912375eb53b9573410a587f88bae2",
".git/objects/e0/04e5754aaf340ea50f6859cee0bfa9e400a2d3": "3f9c66c7c8b2b844d20af7efabbb0cb8",
".git/objects/e1/2c10a12ebb22be5d0486b62d0ef6d4f5d4580a": "757079b7f0c2f9b776509ca99e1cff14",
".git/objects/e4/6ef18491adc94bb428a609edb9dd79eb2126f6": "9149beb718bd58bd2b4156a1a455288c",
".git/objects/e4/998878758e5d731e06fd45935556b66ee0b226": "182d167c9637ac1d3b543c94adc005ba",
".git/objects/e5/fb844535e78d3b1ce7e5b03a0c7fd4cd93da71": "2ef6ef30f13cd690fca13604b786a625",
".git/objects/e9/12278ef88e5b8608246755edeb690684d68674": "b35c505086d418a200c347443de7ec96",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f0/082556f5ef1460fe1150ab7cbbed8a91e1f1f1": "e26aa2ec99d2fe18d796e2cb5ac7fc8e",
".git/objects/f0/442ecf6ad246f1c2db39d61b8ca7320af75c35": "31146459fad83ce722d149638fde3de2",
".git/objects/f0/753ffe053674d08a2da61672f94132184f4817": "e5de951c6b4ccd9df89095469565b90a",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/587ad79eb2752b755db3d79aeaaf69da87b7f3": "dde150da82e07e51d94eeaedd5506f32",
".git/objects/f5/010cda95492006dae3638dfb01a8d0822a1e6a": "04eb9fcdf209b67f396e5ab84cb956e2",
".git/objects/f7/0454ca6aa51e7695bdbde27c7e4457b1d33415": "26c29896bf0a75786d38b933e7827a46",
".git/objects/f7/4cd2a4e6c5c0961c1d61bd959fccdb3590e1f2": "fdec18fc34606a4ab17aeed336ac279c",
".git/objects/fe/421d4f585af8849418fb8a920758f3e3834cc5": "da94f22e174c0e008b57a149229b3a6e",
".git/ORIG_HEAD": "04fc5ca321508e50989e3ab398445e11",
".git/refs/heads/main": "a22bba709cffa2e0ff7e3bf4ee58158b",
".git/refs/heads/update/1908": "04fc5ca321508e50989e3ab398445e11",
".git/refs/remotes/origin/main": "a22bba709cffa2e0ff7e3bf4ee58158b",
".git/refs/remotes/origin/update/1908": "04fc5ca321508e50989e3ab398445e11",
"assets/AssetManifest.bin": "e1de4d47b377e045a6d50c9d5cbadaf5",
"assets/AssetManifest.bin.json": "1bb3a34367dcb25474c4d7180400f42c",
"assets/AssetManifest.json": "2c02eaef24554e58836ed2180c6611d9",
"assets/assets/images/america.png": "c30f381cfe1302b77b4b0dfa2279a68d",
"assets/assets/images/loading_airdata.gif": "8935e1b6df2349df8fca5511c90e418d",
"assets/assets/images/tungqu.jpg": "a63b6a0f12996e4689250b829b320149",
"assets/assets/images/vietnam.png": "f42e6fa30cdb00c75fc72bd0332b9075",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "662a5bc22523e2fce86f2b184039abe8",
"assets/NOTICES": "82e7f6473e1b25e12d0cb5c74a922615",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "1d03f91d07f601785fb6eb97c56e8c16",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e1ede03a580c06332942a261682e7a5b",
"/": "e1ede03a580c06332942a261682e7a5b",
"main.dart.js": "56feb4b5074de2e3a384bbea238b3271",
"manifest.json": "14962f8ee3d7420a169ef1d219058866",
"version.json": "30d4ee84e7852ef7971878849e9f0a73"};
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
