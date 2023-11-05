import 'package:get_it/get_it.dart';
import 'package:get_it_dependency_injection/app_services.dart';

final locator = GetIt.instance;

void setup() {
  print("setup is worked");
  locator.registerSingleton<AppServices>(AppServices());
}
