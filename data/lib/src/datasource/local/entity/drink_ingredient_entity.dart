
import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'Drink_Ingredient')
class DrinkIngredientEntity extends BaseEntity{
  final int DrinkID;
  final int IngredientID;
  final int MeasureID;

  DrinkIngredientEntity(this.DrinkID, this.IngredientID, this.MeasureID,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}