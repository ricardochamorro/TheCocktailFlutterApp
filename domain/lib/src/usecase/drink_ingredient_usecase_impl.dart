import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_ingredient_model.dart';
import 'package:domain/src/repository/drink_ingredient_repository.dart';
import 'package:domain/src/usecase/drink_ingredient_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllDrinkIngredientsUseCase)
class GetAllDrinkIngredientsUseCaseImpl extends GetAllDrinkIngredientsUseCase {
  final DrinkIngredientRepository _repository;
  GetAllDrinkIngredientsUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<DrinkIngredientModel>?>> getDrinkIngredients(bool forceRefresh)  => _repository.getDrinkIngredients(forceRefresh);
}

@Injectable(as: GetDrinkIngredientByNameUseCase)
class GetDrinkIngredientByNameUseCaseImpl extends GetDrinkIngredientByNameUseCase {
  final DrinkIngredientRepository _repository;
  GetDrinkIngredientByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<DrinkIngredientModel?>> getDrinkIngredientByName(String name)  => _repository.getDrinkIngredient(name);
}

