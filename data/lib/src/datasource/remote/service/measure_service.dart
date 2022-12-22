import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/remote/dto/measure_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'measure_service.g.dart';

@RestApi()
abstract class MeasureService {
  factory MeasureService(Dio dio, {String baseUrl}) = _MeasureService;

  @GET("list.php?c=list")
  Future<MeasureResponse> getMeasures();
}