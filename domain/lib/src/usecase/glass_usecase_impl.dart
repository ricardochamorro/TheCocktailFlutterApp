import 'package:domain/domain.dart';
import 'package:domain/src/model/glass_model.dart';
import 'package:domain/src/repository/glass_repository.dart';
import 'package:domain/src/usecase/glass_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllGlassesUseCase)
class GetAllGlassesUseCaseImpl extends GetAllGlassesUseCase {
  final GlassRepository _repository;

  GetAllGlassesUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<GlassModel>?>> getGlasses(bool forceRefresh)  => _repository.getGlasses(forceRefresh);
}

@Injectable(as: GetGlassByNameUseCase)
class GetGlassByNameUseCaseImpl extends GetGlassByNameUseCase {
  final GlassRepository _repository;

  GetGlassByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<GlassModel?>> getGlassByName(String name)  => _repository.getGlass(name);

}

