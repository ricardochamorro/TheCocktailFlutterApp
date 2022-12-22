
import 'package:domain/domain.dart';
import 'package:domain/src/model/category_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllCategoriesUseCase implements BaseUseCase {
  Stream<Resource<List<CategoryModel>?>> getCategories(bool forceRefresh);
}

abstract class GetCategoryByNameUseCase implements BaseUseCase {
  Stream<Resource<CategoryModel?>> getCategoryByName(String name);
}
