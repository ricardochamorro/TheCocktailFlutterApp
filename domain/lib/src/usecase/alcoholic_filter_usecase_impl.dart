import 'package:domain/domain.dart';
import 'package:domain/src/model/alcoholic_filter_model.dart';
import 'package:domain/src/repository/alcoholic_filter_repository.dart';
import 'package:domain/src/usecase/alcoholic_filter_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllAlcoholicFiltersUseCase)
class GetAllAlcoholicFiltersUseCaseImpl extends GetAllAlcoholicFiltersUseCase {
  final AlcoholicFilterRepository _repository;

  GetAllAlcoholicFiltersUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<AlcoholicFilterModel>?>> getAlcoholicFilters(bool forceRefresh)  => _repository.getAlcoholicFilters(forceRefresh);
}

@Injectable(as: GetAlcoholicFilterByNameUseCase)
class GetAlcoholicFilterByNameUseCaseImpl extends GetAlcoholicFilterByNameUseCase {
  final AlcoholicFilterRepository _repository;

  GetAlcoholicFilterByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<AlcoholicFilterModel?>> getAlcoholicFilterByName(String name)  => _repository.getAlcoholicFilter(name);

}

