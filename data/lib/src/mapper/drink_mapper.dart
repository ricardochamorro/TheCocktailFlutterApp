
import 'package:data/src/datasource/local/entity/drink_entity.dart';
import 'package:data/src/datasource/remote/dto/drink_response.dart';
import 'package:domain/domain.dart';

extension DrinkExtension on Drink {
  DrinkModel toModel() => DrinkModel(int.parse(DrinkID!), Name ?? "", Iba ?? "", Category ?? "", AlcoholicFilter ??  "", Glass ??  "", Instructions ?? "", DrinkThumbnail ?? "", Ingredient1 ?? "", Ingredient2 ?? "", Ingredient3 ?? "", Ingredient4 ?? "", Ingredient5 ?? "", Ingredient6 ?? "", Ingredient7 ?? "", Ingredient8 ?? "", Ingredient9 ?? "", Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  DrinkEntity toEntity() => DrinkEntity(int.parse(DrinkID!), Name ?? "", Iba ?? "", Category ?? "", AlcoholicFilter ??  "", Glass ??  "", Instructions ?? "", DrinkThumbnail ?? "", Ingredient1 ?? "", Ingredient2 ?? "", Ingredient3 ?? "", Ingredient4 ?? "", Ingredient5 ?? "", Ingredient6 ?? "", Ingredient7 ?? "", Ingredient8 ?? "", Ingredient9 ?? "",  Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension DrinkEntityExtension on DrinkEntity {
  DrinkModel toModel() => DrinkModel(DrinkID, Name, Iba, Category, AlcoholicFilter, Glass, Instructions, DrinkThumbnail, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Ingredient9,  Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}