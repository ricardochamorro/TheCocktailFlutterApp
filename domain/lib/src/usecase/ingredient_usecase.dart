
import 'package:domain/domain.dart';
import 'package:domain/src/model/ingredient_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllIngredientsUseCase implements BaseUseCase {
  Stream<Resource<List<IngredientModel>?>> getIngredients(bool forceRefresh);
}

abstract class GetIngredientByNameUseCase implements BaseUseCase {
  Stream<Resource<IngredientModel?>> getIngredientByName(String name);
}
