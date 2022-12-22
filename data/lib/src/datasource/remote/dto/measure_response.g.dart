// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureResponse _$MeasureResponseFromJson(Map<String, dynamic> json) =>
    MeasureResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => Measure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeasureResponseToJson(MeasureResponse instance) =>
    <String, dynamic>{
      'drinks': instance.measures,
    };

Measure _$MeasureFromJson(Map<String, dynamic> json) => Measure(
      json['strMeasure'] as String,
    );

Map<String, dynamic> _$MeasureToJson(Measure instance) => <String, dynamic>{
      'strMeasure': instance.Name,
    };
