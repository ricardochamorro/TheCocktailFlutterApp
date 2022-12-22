import 'package:data/src/datasource/local/entity/glass_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Glass';

@dao
abstract class GlassDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<GlassEntity>> findAllGlasses();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<GlassEntity?> findGlassByName(String Name);

  @insert
  Future<void> insertGlass(GlassEntity glass);
}