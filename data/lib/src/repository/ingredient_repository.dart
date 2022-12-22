import 'package:data/src/datasource/local/dao/ingredient_dao.dart';
import 'package:data/src/datasource/local/entity/ingredient_entity.dart';
import 'package:data/src/datasource/remote/dto/ingredient_response.dart';
import 'package:data/src/datasource/remote/service/ingredient_service.dart';
import 'package:data/src/mapper/ingredient_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: IngredientRepository)
class IngredientRepositoryImpl extends BaseRepository
    implements IngredientRepository {
  final IngredientService _ingredientService;
  final IngredientDao _ingredientDao;

  IngredientRepositoryImpl(this._ingredientService, this._ingredientDao);

  @override
  Stream<Resource<IngredientModel?>> getIngredient(String name) {
    return getLocalData<IngredientEntity, IngredientModel>(
        loadFromDb: () => _ingredientDao.findIngredientByName(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<IngredientModel>?>> getIngredients(bool forceRefresh) {

    if (forceRefresh)
      return getNetworkData<IngredientResponse?, List<IngredientModel>>(
          createNetworkCall: () => _ingredientService.getIngredients(),
          map: (response) =>
              response?.ingredients.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<IngredientResponse?, List<IngredientEntity>,
          List<IngredientModel>>(
          loadFromDb: () => _ingredientDao.findAllIngredients(),
          createNetworkCall: () => _ingredientService.getIngredients(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await _ingredientDao.saveIngredients(
                  response.ingredients.map((e) => e.toEntity()).toList());
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }

}
