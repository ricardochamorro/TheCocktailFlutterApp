
import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'Drink')
class DrinkEntity extends BaseEntity {
  int DrinkID;
  String Name;
  String Iba;

  String Category;
  String AlcoholicFilter;
  String Glass;

  String Instructions;
  String DrinkThumbnail;

  String Ingredient1;
  String Ingredient2;
  String Ingredient3;
  String Ingredient4;
  String Ingredient5;
  String Ingredient6;
  String Ingredient7;
  String Ingredient8;
  String Ingredient9;


  DrinkEntity(this.DrinkID, this.Name, this.Iba, this.Category, this.AlcoholicFilter,
              this.Glass, this.Instructions, this.DrinkThumbnail, this.Ingredient1,
              this.Ingredient2,this.Ingredient3,this.Ingredient4,this.Ingredient5,
              this.Ingredient6,this.Ingredient7,this.Ingredient8,this.Ingredient9,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);

}