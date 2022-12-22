import 'package:domain/domain.dart';
import 'package:domain/src/model/alcoholic_filter_model.dart';

abstract class AlcoholicFilterRepository {
  Stream<Resource<List<AlcoholicFilterModel>?>> getAlcoholicFilters(bool forceRefresh);
  Stream<Resource<AlcoholicFilterModel?>> getAlcoholicFilter(String name);
}
