library data;

import 'package:data/src/di/locator.dart';

class Data {
  static Future<void> init() async {
    /// setup required locators for data module
    await setupLocator();
  }
}
