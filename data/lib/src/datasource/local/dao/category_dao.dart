import 'package:data/src/datasource/local/entity/category_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Category';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<CategoryEntity>> findAllCategories();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<CategoryEntity?> findCategoryByName(String Name);

  @insert
  Future<void> insertCategory(CategoryEntity category);
}