
import 'package:json_annotation/json_annotation.dart';

part 'glass_response.g.dart';

@JsonSerializable()
class GlassResponse {

  @JsonKey(name: 'drinks')
  final List<Glass> glasses;

  GlassResponse(this.glasses);

  factory GlassResponse.fromJson(Map<String, dynamic> json) =>
      _$GlassResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlassResponseToJson(this);
}

@JsonSerializable()
class Glass {
  @JsonKey(name: 'strGlass')
  final String Name;

  Glass(this.Name);

  factory Glass.fromJson(Map<String, dynamic> json) =>
      _$GlassFromJson(json);

  Map<String, dynamic> toJson() => _$GlassToJson(this);

}
