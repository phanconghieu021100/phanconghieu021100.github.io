import 'flavor/flavor_config.dart';
import 'main.dart' as app;

void main() {
  FlavorConfig.setEnvironment('PROD');
  app.main();
}
