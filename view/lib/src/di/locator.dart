
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance..allowReassignment = true;

@injectableInit
Future<void> setupLocator() async {
  _init(locator);
  await $initGetIt(locator);
}

Future<void> _init(GetIt locator) async {

}