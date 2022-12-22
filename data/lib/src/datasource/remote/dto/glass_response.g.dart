// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glass_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlassResponse _$GlassResponseFromJson(Map<String, dynamic> json) =>
    GlassResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => Glass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GlassResponseToJson(GlassResponse instance) =>
    <String, dynamic>{
      'drinks': instance.glasses,
    };

Glass _$GlassFromJson(Map<String, dynamic> json) => Glass(
      json['strGlass'] as String,
    );

Map<String, dynamic> _$GlassToJson(Glass instance) => <String, dynamic>{
      'strGlass': instance.Name,
    };
