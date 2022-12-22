import 'package:domain/domain.dart';
import 'package:domain/src/model/category_model.dart';

abstract class CategoryRepository {
  Stream<Resource<List<CategoryModel>?>> getCategories(bool forceRefresh);
  Stream<Resource<CategoryModel?>> getCategory(String name);
}
