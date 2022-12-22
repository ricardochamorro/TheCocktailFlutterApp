
import 'package:json_annotation/json_annotation.dart';

part 'drink_ingredient_response.g.dart';

@JsonSerializable()
class DrinkIngredientResponse {

  @JsonKey(name: 'drinks')
  final List<DrinkIngredient> drinkIngredients;

  DrinkIngredientResponse(this.drinkIngredients);

  factory DrinkIngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkIngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkIngredientResponseToJson(this);
}

@JsonSerializable()
class DrinkIngredient {
  @JsonKey(name: 'DrinkID')
  final int DrinkID;
  @JsonKey(name: 'IngredientID')
  final int IngredientID;
  @JsonKey(name: 'MeasureID')
  final int MeasureID;

  DrinkIngredient(this.DrinkID, this.IngredientID, this.MeasureID);

  factory DrinkIngredient.fromJson(Map<String, dynamic> json) =>
      _$DrinkIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkIngredientToJson(this);

}
