import 'package:auto_route/annotations.dart';
import 'package:view/src/features/main/main_screen.dart';

import '../../features/main/drink_screen.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: MainScreen, initial: true),
  AutoRoute(page: DrinkScreen),
])
class $FeatureRouter {}

