import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/drink_ingredient_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'drink_ingredient_service.g.dart';

@RestApi()
abstract class DrinkIngredientService {
  factory DrinkIngredientService(Dio dio, {String baseUrl}) = _DrinkIngredientService;

  @GET("list.php?c=list")
  Future<DrinkIngredientResponse> getDrinkIngredients();
}