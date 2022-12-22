// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientResponse _$IngredientResponseFromJson(Map<String, dynamic> json) =>
    IngredientResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngredientResponseToJson(IngredientResponse instance) =>
    <String, dynamic>{
      'drinks': instance.ingredients,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      json['strIngredient1'] as String,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'strIngredient1': instance.Name,
    };
