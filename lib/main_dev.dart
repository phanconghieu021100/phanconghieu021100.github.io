import 'flavor/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig.setEnvironment('DEV');
  app.main();
}
