// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_ingredient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkIngredientResponse _$DrinkIngredientResponseFromJson(
        Map<String, dynamic> json) =>
    DrinkIngredientResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => DrinkIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkIngredientResponseToJson(
        DrinkIngredientResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinkIngredients,
    };

DrinkIngredient _$DrinkIngredientFromJson(Map<String, dynamic> json) =>
    DrinkIngredient(
      json['DrinkID'] as int,
      json['IngredientID'] as int,
      json['MeasureID'] as int,
    );

Map<String, dynamic> _$DrinkIngredientToJson(DrinkIngredient instance) =>
    <String, dynamic>{
      'DrinkID': instance.DrinkID,
      'IngredientID': instance.IngredientID,
      'MeasureID': instance.MeasureID,
    };
