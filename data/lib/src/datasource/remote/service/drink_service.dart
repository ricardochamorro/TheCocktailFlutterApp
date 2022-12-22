import 'package:data/src/datasource/remote/dto/drink_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'drink_service.g.dart';

@RestApi()
abstract class DrinkService {
  factory DrinkService(Dio dio, {String baseUrl}) = _DrinkService;

  @GET("filter.php?c=Cocktail")
  Future<DrinkResponse?> getDrinks();

  @GET("search.php?f={letter}")
  Future<DrinkResponse?> getDrinksByFirstLetter(@Path("letter") String firstLetter);

  @GET("random.php")
  Future<DrinkResponse?> getRandomDrink();
}