
import 'package:domain/domain.dart';
import 'package:domain/src/model/measure_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllMeasuresUseCase implements BaseUseCase {
  Stream<Resource<List<MeasureModel>?>> getMeasures(bool forceRefresh);
}

abstract class GetMeasureByNameUseCase implements BaseUseCase {
  Stream<Resource<MeasureModel?>> getMeasureByName(String name);
}
