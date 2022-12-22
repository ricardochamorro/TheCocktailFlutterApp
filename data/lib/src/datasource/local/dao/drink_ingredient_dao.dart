import 'package:data/src/datasource/local/entity/drink_ingredient_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Glass';

@dao
abstract class DrinkIngredientDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<DrinkIngredientEntity>> findAllDrinkIngredients();

  @Query('SELECT * FROM $_tableName WHERE name = :name')
  Future<DrinkIngredientEntity?> findDrinkByIngredient(String name);

  @insert
  Future<void> insertGlass(DrinkIngredientEntity drinkIngredient);
}