
import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_ingredient_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllDrinkIngredientsUseCase implements BaseUseCase {
  Stream<Resource<List<DrinkIngredientModel>?>> getDrinkIngredients(bool forceRefresh);
}

abstract class GetDrinkIngredientByNameUseCase implements BaseUseCase {
  Stream<Resource<DrinkIngredientModel?>> getDrinkIngredientByName(String name);
}
