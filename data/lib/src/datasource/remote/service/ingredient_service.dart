import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/ingredient_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ingredient_service.g.dart';

@RestApi()
abstract class IngredientService {
  factory IngredientService(Dio dio, {String baseUrl}) = _IngredientService;

  @GET("list.php?i=list")
  Future<IngredientResponse?> getIngredients();
}