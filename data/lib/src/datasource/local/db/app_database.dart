import 'dart:async';
import 'package:data/src/datasource/local/dao/alcoholic_filter_dao.dart';
import 'package:data/src/datasource/local/dao/category_dao.dart';
import 'package:data/src/datasource/local/dao/drink_dao.dart';
import 'package:data/src/datasource/local/dao/drink_ingredient_dao.dart';
import 'package:data/src/datasource/local/dao/glass_dao.dart';
import 'package:data/src/datasource/local/dao/ingredient_dao.dart';
import 'package:data/src/datasource/local/dao/measure_dao.dart';
import 'package:data/src/datasource/local/entity/alcoholic_filter_entity.dart';
import 'package:data/src/datasource/local/entity/category_entity.dart';
import 'package:data/src/datasource/local/entity/drink_entity.dart';
import 'package:data/src/datasource/local/entity/drink_ingredient_entity.dart';
import 'package:data/src/datasource/local/entity/glass_entity.dart';
import 'package:data/src/datasource/local/entity/ingredient_entity.dart';
import 'package:data/src/datasource/local/entity/measure_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [AlcoholicFilterEntity, CategoryEntity, DrinkEntity, DrinkIngredientEntity,
                                 GlassEntity, IngredientEntity, MeasureEntity])

abstract class AppDatabase extends FloorDatabase {
  AlcoholicFilterDao get alcoholicFilterDao;
  CategoryDao get categoryDao;
  DrinkDao get drinkDao;
  DrinkIngredientDao get drinkIngredientDao;
  GlassDao get glassDao;
  IngredientDao get ingredientDao;
  MeasureDao get measureDao;
}