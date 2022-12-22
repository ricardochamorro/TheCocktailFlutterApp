
import 'package:domain/domain.dart';
import 'package:domain/src/model/alcoholic_filter_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllAlcoholicFiltersUseCase implements BaseUseCase {
  Stream<Resource<List<AlcoholicFilterModel>?>> getAlcoholicFilters(bool forceRefresh);
}

abstract class GetAlcoholicFilterByNameUseCase implements BaseUseCase {
  Stream<Resource<AlcoholicFilterModel?>> getAlcoholicFilterByName(String name);
}
