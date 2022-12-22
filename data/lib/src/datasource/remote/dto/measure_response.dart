
import 'package:json_annotation/json_annotation.dart';

part 'measure_response.g.dart';

@JsonSerializable()
class MeasureResponse {

  @JsonKey(name: 'drinks')
  final List<Measure> measures;

  MeasureResponse(this.measures);

  factory MeasureResponse.fromJson(Map<String, dynamic> json) =>
      _$MeasureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureResponseToJson(this);
}

@JsonSerializable()
class Measure {
  @JsonKey(name: 'strMeasure')
  final String Name;

  Measure(this.Name);

  factory Measure.fromJson(Map<String, dynamic> json) =>
      _$MeasureFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureToJson(this);

}
