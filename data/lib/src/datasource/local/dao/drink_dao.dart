import 'package:data/src/datasource/local/entity/drink_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Drink';

@dao
abstract class DrinkDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<DrinkEntity>> findAllDrinks();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<DrinkEntity?> findDrinkByName(String Name);

  @Query('SELECT * FROM $_tableName WHERE SUBSTR(Name,1,1) = :firstLetter')
  Future<List<DrinkEntity>> findDrinkByFirstLetter(String firstLetter);

  @Query('SELECT * FROM $_tableName ORDER BY 1 DESC')
  Future<DrinkEntity?> getRandomDrink();

  @insert
  Future<void> insertDrink(DrinkEntity drink);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> saveDrinks(List<DrinkEntity> drinks);

}