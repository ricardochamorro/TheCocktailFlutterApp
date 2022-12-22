
import 'package:data/src/datasource/local/entity/drink_ingredient_entity.dart';
import 'package:data/src/datasource/remote/dto/drink_ingredient_response.dart';
import 'package:domain/domain.dart';

extension DrinkIngredientExtension on DrinkIngredient {
  DrinkIngredientModel toModel() => DrinkIngredientModel(DrinkID, IngredientID, MeasureID, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  DrinkIngredientEntity toEntity() => DrinkIngredientEntity(DrinkID, IngredientID, MeasureID, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension DrinkIngredientEntityExtension on DrinkIngredientEntity {
  DrinkIngredientModel toModel() => DrinkIngredientModel(DrinkID, IngredientID, MeasureID, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension DrinkIngredientModelExtension on DrinkIngredientModel {
  DrinkIngredientModel toModel() => DrinkIngredientModel(DrinkID, IngredientID, MeasureID, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  DrinkIngredientEntity toEntity() => DrinkIngredientEntity(DrinkID, IngredientID, MeasureID, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}
