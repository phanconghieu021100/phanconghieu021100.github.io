enum AppFlavor { DEV, PROD }

class FlavorConfig {
  static late AppFlavor appFlavor;

  static void setEnvironment(String flavor) {
    switch (flavor) {
      case 'DEV':
        appFlavor = AppFlavor.DEV;
        break;
      case 'PROD':
        appFlavor = AppFlavor.PROD;
        break;
      default:
        throw Exception("Unknown flavor: $flavor");
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case AppFlavor.DEV:
        return "http://localhost:8080";
      case AppFlavor.PROD:
        return "https://restaurant-yz31.onrender.com";
    }
  }

  static bool get isDev => appFlavor == AppFlavor.DEV;
}
