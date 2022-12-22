import 'package:domain/domain.dart';
import 'package:domain/src/model/measure_model.dart';

abstract class MeasureRepository {
  Stream<Resource<List<MeasureModel>?>> getMeasures(bool forceRefresh);
  Stream<Resource<MeasureModel?>> getMeasure(String name);
}
