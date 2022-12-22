
import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllDrinksUseCase implements BaseUseCase {
  Stream<Resource<List<DrinkModel>?>> getDrinks(bool forceRefresh);
}

abstract class GetDrinkByNameUseCase implements BaseUseCase {
  Stream<Resource<DrinkModel?>> getDrinkByName(String name);
}

abstract class GetDrinksByFirstLetterUseCase implements BaseUseCase {
  Stream<Resource<List<DrinkModel>?>> getDrinksByFirstLetter(String firstLetter);
}

abstract class GetRandomDrinkUseCase implements BaseUseCase {
  Stream<Resource<DrinkModel?>> getRandomDrink(bool forceRefresh);
}
