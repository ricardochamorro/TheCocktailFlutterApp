import 'package:auto_route/auto_route.dart';
import 'package:core/src/di/locator.dart';

import 'lib/src/di/locator.dart';

class Core {
  static void init() {
    setupLocator();
  }

  static RootStackRouter routeBuilder(RootStackRouter router) {
    locator.registerLazySingleton<StackRouter>(() => router);
    return router;
  }
}
