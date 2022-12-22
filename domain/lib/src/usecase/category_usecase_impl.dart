import 'package:domain/domain.dart';
import 'package:domain/src/usecase/category_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllCategoriesUseCase)
class GetAllCategoriesUseCaseImpl extends GetAllCategoriesUseCase {
  final CategoryRepository _repository;

  GetAllCategoriesUseCaseImpl(this._repository);

  @override
  Stream<Resource<List<CategoryModel>?>> getCategories(bool forceRefresh)  => _repository.getCategories(forceRefresh);
}

@Injectable(as: GetCategoryByNameUseCase)
class GetCategoryByNameUseCaseImpl extends GetCategoryByNameUseCase {
  final CategoryRepository _repository;

  GetCategoryByNameUseCaseImpl(this._repository);

  @override
  Stream<Resource<CategoryModel?>> getCategoryByName(String name)  => _repository.getCategory(name);
}

