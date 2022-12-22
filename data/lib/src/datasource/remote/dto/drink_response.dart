
import 'package:json_annotation/json_annotation.dart';

part 'drink_response.g.dart';

@JsonSerializable()
class DrinkResponse {

  @JsonKey(name: 'drinks')
  final List<Drink> drink;

  DrinkResponse(this.drink);

  factory DrinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkResponseToJson(this);
}

@JsonSerializable()
class Drink {
  @JsonKey(name: 'strDrink')
  final String? Name;

  @JsonKey(name: 'idDrink')
  String? DrinkID;

  @JsonKey(name: 'strIBA')
  String? Iba;

  @JsonKey(name: 'strCategory')
  String? Category;

  @JsonKey(name: 'strAlcoholic')
  String? AlcoholicFilter;

  @JsonKey(name: 'strGlass')
  String? Glass;

  @JsonKey(name: 'strInstructions')
  String? Instructions;

  @JsonKey(name: 'strDrinkThumb')
  String? DrinkThumbnail;

  @JsonKey(name: 'strIngredient1')
  String? Ingredient1;

  @JsonKey(name: 'strIngredient2')
  String? Ingredient2;

  @JsonKey(name: 'strIngredient3')
  String? Ingredient3;

  @JsonKey(name: 'strIngredient4')
  String? Ingredient4;

  @JsonKey(name: 'strIngredient5')
  String? Ingredient5;

  @JsonKey(name: 'strIngredient6')
  String? Ingredient6;

  @JsonKey(name: 'strIngredient7')
  String? Ingredient7;

  @JsonKey(name: 'strIngredient8')
  String? Ingredient8;

  @JsonKey(name: 'strIngredient9')
  String? Ingredient9;

  Drink(this.Name, this.DrinkID, this.Iba, this.Category, this.AlcoholicFilter,
        this.Glass,this.Instructions, this.DrinkThumbnail,  this.Ingredient1,
        this.Ingredient2,this.Ingredient3,this.Ingredient4,this.Ingredient5,
        this.Ingredient6,this.Ingredient7,this.Ingredient8,this.Ingredient9,);

  factory Drink.fromJson(Map<String, dynamic> json) =>
      _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);

}
