// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcoholic_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlcoholicFilterResponse _$AlcoholicFilterResponseFromJson(
        Map<String, dynamic> json) =>
    AlcoholicFilterResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => AlcoholicFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlcoholicFilterResponseToJson(
        AlcoholicFilterResponse instance) =>
    <String, dynamic>{
      'drinks': instance.alcoholicFilters,
    };

AlcoholicFilter _$AlcoholicFilterFromJson(Map<String, dynamic> json) =>
    AlcoholicFilter(
      json['strAlcoholic'] as String,
    );

Map<String, dynamic> _$AlcoholicFilterToJson(AlcoholicFilter instance) =>
    <String, dynamic>{
      'strAlcoholic': instance.Name,
    };
