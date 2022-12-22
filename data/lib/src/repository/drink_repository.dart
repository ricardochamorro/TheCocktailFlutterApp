import 'package:data/src/datasource/local/dao/alcoholic_filter_dao.dart';
import 'package:data/src/datasource/local/dao/category_dao.dart';
import 'package:data/src/datasource/local/dao/drink_dao.dart';
import 'package:data/src/datasource/local/dao/glass_dao.dart';
import 'package:data/src/datasource/local/entity/category_entity.dart';
import 'package:data/src/datasource/local/entity/drink_entity.dart';
import 'package:data/src/datasource/remote/dto/drink_response.dart';
import 'package:data/src/datasource/remote/service/drink_service.dart';
import 'package:data/src/mapper/drink_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: DrinkRepository)
class DrinkRepositoryImpl extends BaseRepository
    implements DrinkRepository {
  final DrinkService _drinkService;
  final DrinkDao _drinkDao;
  final AlcoholicFilterDao _alcoholicFilterDao;
  final GlassDao _glassDao;
  final CategoryDao _categoryDao;

  DrinkRepositoryImpl(this._drinkService, this._drinkDao, this._alcoholicFilterDao, this._glassDao, this._categoryDao);

  @override
  Stream<Resource<DrinkModel?>> getDrink(String name) {
    return getLocalData<DrinkEntity, DrinkModel>(
        loadFromDb: () => _drinkDao.findDrinkByName(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<DrinkModel>?>> getDrinks(bool forceRefresh) {
    if (forceRefresh)
      return getNetworkData<DrinkResponse?, List<DrinkModel>>(
          createNetworkCall: () => _drinkService.getDrinks(),
          map: (response) =>
              response?.drink.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<DrinkResponse?, List<DrinkEntity>,
          List<DrinkModel>>(
          loadFromDb: () => _drinkDao.findAllDrinks(),
          createNetworkCall: () => _drinkService.getDrinks(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await response.drink.map((e) => _drinkDao.insertDrink(e.toEntity()));
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }

  @override
  Stream<Resource<List<DrinkModel>?>> getDrinksByFirstLetter(String firstLetter) {
      return getNetworkBoundData<DrinkResponse?, List<DrinkEntity>,
          List<DrinkModel>>(
          loadFromDb: () => _drinkDao.findDrinkByFirstLetter(firstLetter),
          createNetworkCall: () => _drinkService.getDrinksByFirstLetter(firstLetter),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await _drinkDao.saveDrinks(
                  response.drink.map((e) => e.toEntity()).toList());
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }



  @override
  Stream<Resource<DrinkModel?>> getRandomDrink(bool forceRefresh) {
    Stream<Resource<DrinkModel?>> result = getNetworkData<DrinkResponse?,DrinkModel>(
        createNetworkCall: () => _drinkService.getRandomDrink(),
        map: (list) => list?.drink.first.toModel(),
    );
    return result;
        }


}
