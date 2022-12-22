import 'package:data/src/datasource/local/entity/measure_entity.dart';
import 'package:floor/floor.dart';

const _tableName = 'Measure';

@dao
abstract class MeasureDao {
  @Query('SELECT * FROM $_tableName')
  Future<List<MeasureEntity>> findAllMeasures();

  @Query('SELECT * FROM $_tableName WHERE Name = :Name')
  Future<MeasureEntity?> findMeasureByName(String Name);

  @insert
  Future<void> insertMeasure(MeasureEntity measure);
}