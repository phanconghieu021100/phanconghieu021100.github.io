import 'package:phanconghieu020100/app_config/url.dart';

enum Flavor { DEV, STAGING, PRODUCTION }

class AppConfig {
  final String name;
  final bool log;
  final String baseAuthzApi;
  final String baseCMSApi;
  final String basePromoApi;
  final String baseNotiApi;
  final String signUpUrl;
  final Flavor flavor;

  const AppConfig({
    required this.name,
    required this.log,
    required this.flavor,
    required this.baseAuthzApi,
    required this.baseCMSApi,
    required this.basePromoApi,
    required this.baseNotiApi,
    required this.signUpUrl,
  });
  static AppConfig? _instance;

  static AppConfig get instance => _instance!;

  factory AppConfig.fromFlavor(
      {Flavor flavor = Flavor.DEV, bool isMiniApp = false}) {
    if (_instance != null) return _instance!;
    switch (flavor) {
      case Flavor.DEV:
        _instance = const AppConfig(
            name: 'DEV',
            log: true,
            baseAuthzApi: 'https://api-dev.airdata.site/user/api/',
            baseCMSApi: 'https://api-dev.airdata.site/cms/api/',
            basePromoApi: 'https://api-dev.airdata.site/cms/api/',
            baseNotiApi: 'https://api-dev.airdata.site/noti/api/',
            signUpUrl: 'https://dev.airdata.site/register',
            flavor: Flavor.DEV);
        break;
      case Flavor.STAGING:
        _instance = const AppConfig(
            name: 'STAGING',
            log: true,
            baseAuthzApi: AppUrls.baseStagAuthUrl,
            baseCMSApi: AppUrls.baseStagCMSUrl,
            basePromoApi: AppUrls.baseStagPromotionUrl,
            baseNotiApi: AppUrls.baseStagNotiUrl,
            signUpUrl: 'https://stg.airdata.site/register',
            flavor: Flavor.STAGING);
        break;
      case Flavor.PRODUCTION:
        _instance = const AppConfig(
          name: 'PRODUCTION',
          log: false,
          baseAuthzApi: 'https://api.vemaybay.one/user/api/',
          baseCMSApi: 'https://api.vemaybay.one/cms/api/',
          basePromoApi: 'https://api.vemaybay.one/cms/api/',
          baseNotiApi: 'https://api.vemaybay.one/noti/api/',
          signUpUrl: 'https://vemaybay.one/register',
          flavor: Flavor.PRODUCTION,
        );
        break;
      default:
        _instance = const AppConfig(
          name: 'PRODUCTION',
          log: false,
          baseAuthzApi: 'https://api.vemaybay.one/user/api/',
          baseCMSApi: 'https://api.vemaybay.one/cms/api/',
          basePromoApi: 'https://api.vemaybay.one/cms/api/',
          baseNotiApi: 'https://api.vemaybay.one/noti/api/',
          signUpUrl: 'https://vemaybay.one/register',
          flavor: Flavor.PRODUCTION,
        );
    }
    return _instance!;
  }
}
