import 'package:data/src/datasource/local/entity/ingredient_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Ingredient';

@dao
abstract class IngredientDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<IngredientEntity>> findAllIngredients();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<IngredientEntity?> findIngredientByName(String Name);

  @insert
  Future<void> insertIngredient(IngredientEntity ingredient);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> saveIngredients(List<IngredientEntity> drinks);
}