import 'package:floor/floor.dart';

abstract class BaseEntity {

  @PrimaryKey(autoGenerate: true)
  late int? Local_ID;
  final int Created;
  final int Updated;
  final String IsLocalRecord;
  final String IsActive;

  BaseEntity(this.Local_ID, this.Created, this.Updated, this.IsLocalRecord, this.IsActive);
}
