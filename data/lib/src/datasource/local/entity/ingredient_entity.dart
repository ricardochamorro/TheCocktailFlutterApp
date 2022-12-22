import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'Ingredient')
class IngredientEntity extends BaseEntity {
  final String Name;

  IngredientEntity(this.Name,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}