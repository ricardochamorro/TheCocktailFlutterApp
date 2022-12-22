
import 'package:data/src/datasource/local/entity/ingredient_entity.dart';
import 'package:data/src/datasource/remote/dto/ingredient_response.dart';
import 'package:domain/domain.dart';

extension IngredientExtension on Ingredient {
  IngredientModel toModel() => IngredientModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  IngredientEntity toEntity() =>  IngredientEntity(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension IngredientEntityExtension on IngredientEntity {
  IngredientModel toModel() => IngredientModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}