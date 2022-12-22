import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_ingredient_model.dart';

abstract class DrinkIngredientRepository {
  Stream<Resource<List<DrinkIngredientModel>?>> getDrinkIngredients(bool forceRefresh);
  Stream<Resource<DrinkIngredientModel?>> getDrinkIngredient(String name);
}
