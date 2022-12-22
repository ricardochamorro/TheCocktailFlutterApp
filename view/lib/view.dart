library feature;
import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:view/src/common/routes/router.dart';
import 'package:view/src/di/locator.dart';

class View {
  static Future<void> init() async{
    await setupLocator();
    await Data.init();
    await Domain.init();
  }
  static RootStackRouter getFeatureRouter() => FeatureRouter();
}