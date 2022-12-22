import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/category_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'category_service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET("list.php?c=list")
  Future<CategoryResponse> getCategories();
}