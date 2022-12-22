import 'package:domain/domain.dart';
import 'package:domain/src/model/measure_model.dart';
import 'package:domain/src/repository/measure_repository.dart';
import 'package:domain/src/usecase/measure_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllMeasuresUseCase)
class GetAllMeasuresUseCaseImpl extends GetAllMeasuresUseCase {
  final MeasureRepository _repository;

  GetAllMeasuresUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<MeasureModel>?>> getMeasures(bool forceRefresh)  => _repository.getMeasures(forceRefresh);
}

@Injectable(as: GetMeasureByNameUseCase)
class GetMeasureByNameUseCaseImpl extends GetMeasureByNameUseCase {
  final MeasureRepository _repository;

  GetMeasureByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<MeasureModel?>> getMeasureByName(String name)  => _repository.getMeasure(name);

}

