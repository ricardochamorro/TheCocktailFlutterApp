import 'package:data/src/datasource/local/dao/category_dao.dart';
import 'package:data/src/datasource/local/entity/category_entity.dart';
import 'package:data/src/datasource/remote/dto/category_response.dart';
import 'package:data/src/datasource/remote/service/category_service.dart';
import 'package:data/src/mapper/category_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl extends BaseRepository
    implements CategoryRepository {
  final CategoryService _categoryService;
  final CategoryDao _categoryDao;

  CategoryRepositoryImpl(this._categoryService, this._categoryDao);

  @override
  Stream<Resource<CategoryModel?>> getCategory(String name) {
    return getLocalData<CategoryEntity, CategoryModel>(
        loadFromDb: () => _categoryDao.findCategoryByName(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<CategoryModel>?>> getCategories(bool forceRefresh) {
    if (forceRefresh)
      return getNetworkData<CategoryResponse, List<CategoryModel>>(
          createNetworkCall: () => _categoryService.getCategories(),
          map: (response) =>
              response?.categories.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<CategoryResponse, List<CategoryEntity>,
          List<CategoryModel>>(
          loadFromDb: () => _categoryDao.findAllCategories(),
          createNetworkCall: () => _categoryService.getCategories(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await response.categories.map((e) => _categoryDao.insertCategory(e.toEntity()));
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }
}
