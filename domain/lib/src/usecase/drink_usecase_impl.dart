import 'package:domain/domain.dart';
import 'package:domain/src/model/drink_model.dart';
import 'package:domain/src/repository/drink_repository.dart';
import 'package:domain/src/usecase/drink_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllDrinksUseCase)
class GetAllDrinksUseCaseImpl extends GetAllDrinksUseCase {
  final DrinkRepository _repository;

  GetAllDrinksUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<DrinkModel>?>> getDrinks(bool forceRefresh)  => _repository.getDrinks(forceRefresh);
}

@Injectable(as: GetDrinkByNameUseCase)
class GetDrinkByNameUseCaseImpl extends GetDrinkByNameUseCase {
  final DrinkRepository _repository;

  GetDrinkByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<DrinkModel?>> getDrinkByName(String name)  => _repository.getDrink(name);

}

@Injectable(as: GetDrinksByFirstLetterUseCase)
class GetDrinksByFirstLetterUseCaseImpl extends GetDrinksByFirstLetterUseCase {
  final DrinkRepository _repository;

  GetDrinksByFirstLetterUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<DrinkModel>?>> getDrinksByFirstLetter(String firstLetter) => _repository.getDrinksByFirstLetter(firstLetter);
}

@Injectable(as: GetRandomDrinkUseCase)
class GetRandomDrinkUseCaseImpl extends GetRandomDrinkUseCase {
  final DrinkRepository _repository;

  GetRandomDrinkUseCaseImpl(this._repository);

  @override
  Stream<Resource<DrinkModel?>> getRandomDrink(bool forceRefresh)  => _repository.getRandomDrink(forceRefresh);
}

