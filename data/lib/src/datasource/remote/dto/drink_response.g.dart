// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkResponse _$DrinkResponseFromJson(Map<String, dynamic> json) =>
    DrinkResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => Drink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkResponseToJson(DrinkResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drink,
    };

Drink _$DrinkFromJson(Map<String, dynamic> json) => Drink(
      json['strDrink'] as String?,
      json['idDrink'] as String?,
      json['strIBA'] as String?,
      json['strCategory'] as String?,
      json['strAlcoholic'] as String?,
      json['strGlass'] as String?,
      json['strInstructions'] as String?,
      json['strDrinkThumb'] as String?,
      json['strIngredient1'] as String?,
      json['strIngredient2'] as String?,
      json['strIngredient3'] as String?,
      json['strIngredient4'] as String?,
      json['strIngredient5'] as String?,
      json['strIngredient6'] as String?,
      json['strIngredient7'] as String?,
      json['strIngredient8'] as String?,
      json['strIngredient9'] as String?,
    );

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
      'strDrink': instance.Name,
      'idDrink': instance.DrinkID,
      'strIBA': instance.Iba,
      'strCategory': instance.Category,
      'strAlcoholic': instance.AlcoholicFilter,
      'strGlass': instance.Glass,
      'strInstructions': instance.Instructions,
      'strDrinkThumb': instance.DrinkThumbnail,
      'strIngredient1': instance.Ingredient1,
      'strIngredient2': instance.Ingredient2,
      'strIngredient3': instance.Ingredient3,
      'strIngredient4': instance.Ingredient4,
      'strIngredient5': instance.Ingredient5,
      'strIngredient6': instance.Ingredient6,
      'strIngredient7': instance.Ingredient7,
      'strIngredient8': instance.Ingredient8,
      'strIngredient9': instance.Ingredient9,
    };
