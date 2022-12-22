import 'package:data/src/datasource/local/entity/alcoholic_filter_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'AlcoholicFilter';

@dao
abstract class AlcoholicFilterDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<AlcoholicFilterEntity>> findAllAlcoholicFilters();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<AlcoholicFilterEntity?> findAlcoholicFilterByName(String Name);

  @insert
  Future<void> insertAlcoholFilter(AlcoholicFilterEntity alcoholFilter);
}