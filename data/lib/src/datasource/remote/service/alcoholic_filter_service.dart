import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/alcoholic_filter_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'alcoholic_filter_service.g.dart';

@RestApi()
abstract class AlcoholicFilterService {
  factory AlcoholicFilterService(Dio dio, {String baseUrl}) = _AlcoholicFilterService;

  @GET("list.php?a=list")
  Future<AlcoholicFilterResponse> getAlcoholicFilters();
}
