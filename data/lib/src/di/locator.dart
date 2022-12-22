import 'package:data/src/datasource/local/dao/alcoholic_filter_dao.dart';
import 'package:data/src/datasource/local/dao/category_dao.dart';
import 'package:data/src/datasource/local/dao/drink_dao.dart';
import 'package:data/src/datasource/local/dao/drink_ingredient_dao.dart';
import 'package:data/src/datasource/local/dao/glass_dao.dart';
import 'package:data/src/datasource/local/dao/ingredient_dao.dart';
import 'package:data/src/datasource/local/dao/measure_dao.dart';
import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/service/drink_ingredient_service.dart';
import 'package:data/src/datasource/remote/service/drink_service.dart';
import 'package:data/src/datasource/remote/service/ingredient_service.dart';
import 'package:dio/dio.dart';
import 'package:floor/floor.dart';
import 'package:data/src/common/constants.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';
import 'package:sqflite_common/sqlite_api.dart' as sql;

final locator = GetIt.instance..allowReassignment = true;

@injectableInit
Future<void> setupLocator() async {
  await _init(locator);
  $initGetIt(locator);
}

Future<void> _init(GetIt locator) async{
  _registerNetworkModules(locator);
  _registerServices(locator);
  await _registerDatabase(locator);
}

void _registerNetworkModules(GetIt locator) {
  locator.registerSingleton<Dio>(Dio());
}

void _registerServices(GetIt locator)  {
  locator.registerLazySingleton<AlcoholicFilterDao>(() => locator.get<AppDatabase>().alcoholicFilterDao);
  locator.registerLazySingleton<CategoryDao>(() => locator.get<AppDatabase>().categoryDao);
  locator.registerLazySingleton<DrinkIngredientDao>(() => locator.get<AppDatabase>().drinkIngredientDao);
  locator.registerLazySingleton<DrinkDao>(() => locator.get<AppDatabase>().drinkDao);
  locator.registerLazySingleton<GlassDao>(() => locator.get<AppDatabase>().glassDao);
  locator.registerLazySingleton<IngredientDao>(() => locator.get<AppDatabase>().ingredientDao);
  locator.registerLazySingleton<MeasureDao>(() => locator.get<AppDatabase>().measureDao);

  locator.registerLazySingleton<DrinkService>(() => DrinkService(locator<Dio>(), baseUrl: Constants.BASE_URL));
  locator.registerLazySingleton<IngredientService>(() => IngredientService(locator<Dio>(), baseUrl: Constants.BASE_URL));
  locator.registerLazySingleton<DrinkIngredientService>(() => DrinkIngredientService(locator<Dio>(), baseUrl: Constants.BASE_URL));
}

Future<void> _registerDatabase(GetIt locator) async {
  final database = await $FloorAppDatabase.databaseBuilder("cocktail-app.db").build();
  locator.registerLazySingleton<AppDatabase>(() => database);
  locator.registerLazySingleton<DrinkDao>(() => locator.get<AppDatabase>().drinkDao);
  locator.registerLazySingleton<IngredientDao>(() => locator.get<AppDatabase>().ingredientDao);
}
