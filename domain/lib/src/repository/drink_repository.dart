import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_model.dart';

abstract class DrinkRepository {
  Stream<Resource<List<DrinkModel>?>> getDrinks(bool forceRefresh);
  Stream<Resource<DrinkModel?>> getDrink(String name);
  Stream<Resource<DrinkModel?>> getRandomDrink(bool forceRefresh);
  Stream<Resource<List<DrinkModel>?>> getDrinksByFirstLetter(String firstLetter);
}
