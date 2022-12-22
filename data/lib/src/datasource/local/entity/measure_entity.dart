import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'Measure')
class MeasureEntity extends BaseEntity {
  final String Name;

  MeasureEntity(this.Name,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}