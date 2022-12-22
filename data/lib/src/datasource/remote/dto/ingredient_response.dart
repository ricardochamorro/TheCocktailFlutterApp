
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_response.g.dart';

@JsonSerializable()
class IngredientResponse {

  @JsonKey(name: 'drinks')
  final List<Ingredient> ingredients;

  IngredientResponse(this.ingredients);

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientResponseToJson(this);
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: 'strIngredient1')
  final String Name;

  Ingredient(this.Name);

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

}
