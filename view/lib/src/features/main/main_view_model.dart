import 'package:core/core/core_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:view/src/common/routes/router.dart';

@Injectable()
class MainViewModel extends CoreViewModel {
  final GetRandomDrinkUseCase _randomDrinkUseCase;
  final GetAllIngredientsUseCase _allIngredientsUseCase;
  final GetDrinksByFirstLetterUseCase _drinkByFirstLetterUseCase;
  bool _forceRefresh = false;

  MainViewModel(this._randomDrinkUseCase, this._drinkByFirstLetterUseCase,
      this._allIngredientsUseCase);

  Stream<Resource<DrinkModel?>> randomDrink() =>
      _randomDrinkUseCase.getRandomDrink(_forceRefresh);

  Stream<Resource<List<IngredientModel>?>> allIngredientsUseCase() =>
      _allIngredientsUseCase.getIngredients(_forceRefresh);

  Stream<Resource<List<DrinkModel>?>> drinkByFirstLetter(String firstLetter) =>
      _drinkByFirstLetterUseCase.getDrinksByFirstLetter(firstLetter);

  void onClickDrinkCard(DrinkModel model) {
    print(model.Name);
    navigationService.push(DrinkScreenRoute(model: model));
  }
}
