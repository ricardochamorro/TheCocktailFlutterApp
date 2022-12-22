import 'package:domain/src/model/base_model.dart';

class DrinkModel extends BaseModel {
  late int DrinkID;
  late String Name;
  late String Iba;

  late String Category;
  late String AlcoholicFilter;
  late String Glass;

  late String Instructions;
  late String DrinkThumbnail;

  late String Ingredient1;
  late String Ingredient2;
  late String Ingredient3;
  late String Ingredient4;
  late String Ingredient5;
  late String Ingredient6;
  late String Ingredient7;
  late String Ingredient8;
  late String Ingredient9;

  DrinkModel(this.DrinkID, this.Name, this.Iba, this.Category, this.AlcoholicFilter,
             this.Glass, this.Instructions, this.DrinkThumbnail, this.Ingredient1,
             this.Ingredient2,this.Ingredient3,this.Ingredient4,this.Ingredient5,
             this.Ingredient6,this.Ingredient7,this.Ingredient8,this.Ingredient9,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}
