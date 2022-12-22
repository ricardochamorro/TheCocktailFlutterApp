import 'package:domain/domain.dart';
import 'package:domain/src/model/ingredient_model.dart';

abstract class IngredientRepository {
  Stream<Resource<List<IngredientModel>?>> getIngredients(bool forceRefresh);
  Stream<Resource<IngredientModel?>> getIngredient(String name);
}
