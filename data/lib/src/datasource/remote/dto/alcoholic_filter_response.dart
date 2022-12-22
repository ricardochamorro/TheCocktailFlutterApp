
import 'package:json_annotation/json_annotation.dart';

part 'alcoholic_filter_response.g.dart';

@JsonSerializable()
class AlcoholicFilterResponse {

  @JsonKey(name: 'drinks')
  final List<AlcoholicFilter> alcoholicFilters;

  AlcoholicFilterResponse(this.alcoholicFilters);

  factory AlcoholicFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$AlcoholicFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlcoholicFilterResponseToJson(this);
}

@JsonSerializable()
class AlcoholicFilter {
  @JsonKey(name: 'strAlcoholic')
  final String Name;

  AlcoholicFilter(this.Name);

  factory AlcoholicFilter.fromJson(Map<String, dynamic> json) =>
      _$AlcoholicFilterFromJson(json);

  Map<String, dynamic> toJson() => _$AlcoholicFilterToJson(this);

}
