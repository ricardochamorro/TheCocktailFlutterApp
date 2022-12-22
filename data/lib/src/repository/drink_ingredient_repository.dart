import 'package:data/src/datasource/local/dao/drink_ingredient_dao.dart';
import 'package:data/src/datasource/local/entity/drink_ingredient_entity.dart';
import 'package:data/src/datasource/remote/dto/drink_ingredient_response.dart';
import 'package:data/src/datasource/remote/service/drink_ingredient_service.dart';
import 'package:data/src/mapper/drink_ingredient_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: DrinkIngredientRepository)
class DrinkIngredientRepositoryImpl extends BaseRepository
    implements DrinkIngredientRepository {
  final DrinkIngredientService _drinkIngredientService;
  final DrinkIngredientDao _drinkIngredientDao;

  DrinkIngredientRepositoryImpl(this._drinkIngredientService, this._drinkIngredientDao);

  @override
  Stream<Resource<DrinkIngredientModel?>> getDrinkIngredient(String name) {
    return getLocalData<DrinkIngredientEntity, DrinkIngredientModel>(
        loadFromDb: () => _drinkIngredientDao.findDrinkByIngredient(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<DrinkIngredientModel>?>> getDrinkIngredients(bool forceRefresh) {
    if (forceRefresh)
      return getNetworkData<DrinkIngredientResponse, List<DrinkIngredientModel>>(
          createNetworkCall: () => _drinkIngredientService.getDrinkIngredients(),
          map: (response) =>
              response?.drinkIngredients.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<DrinkIngredientResponse, List<DrinkIngredientEntity>,
          List<DrinkIngredientModel>>(
          loadFromDb: () => _drinkIngredientDao.findAllDrinkIngredients(),
          createNetworkCall: () => _drinkIngredientService.getDrinkIngredients(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await response.drinkIngredients.map((e) => _drinkIngredientDao.findAllDrinkIngredients());
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }

}
