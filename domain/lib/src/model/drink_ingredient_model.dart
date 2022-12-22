import 'package:domain/src/model/base_model.dart';

class DrinkIngredientModel extends BaseModel {
  late int DrinkID;
  late int IngredientID;
  late int MeasureID;

  DrinkIngredientModel(this.DrinkID, this.IngredientID, this.MeasureID,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}
