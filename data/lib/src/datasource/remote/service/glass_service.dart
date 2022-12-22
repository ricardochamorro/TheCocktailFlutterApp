import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/glass_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'glass_service.g.dart';

@RestApi()
abstract class GlassService {
  factory GlassService(Dio dio, {String baseUrl}) = _GlassService;

  @GET("list.php?c=list")
  Future<GlassResponse> getGlasss();
}