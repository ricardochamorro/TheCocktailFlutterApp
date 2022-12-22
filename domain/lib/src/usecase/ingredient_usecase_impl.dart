import 'package:domain/domain.dart';
import 'package:domain/src/model/ingredient_model.dart';
import 'package:domain/src/repository/ingredient_repository.dart';
import 'package:domain/src/usecase/ingredient_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllIngredientsUseCase)
class GetAllIngredientsUseCaseImpl extends GetAllIngredientsUseCase {
  final IngredientRepository _repository;

  GetAllIngredientsUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<IngredientModel>?>> getIngredients(bool forceRefresh)  => _repository.getIngredients(forceRefresh);
}

@Injectable(as: GetIngredientByNameUseCase)
class GetIngredientByNameUseCaseImpl extends GetIngredientByNameUseCase {
  final IngredientRepository _repository;

  GetIngredientByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<IngredientModel?>> getIngredientByName(String name)  => _repository.getIngredient(name);

}

