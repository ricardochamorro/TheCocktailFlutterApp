abstract class BaseModel{
  final int? Local_ID;
  final int Created;
  final int Updated;
  late  String IsLocalRecord;
  final String IsActive;

  BaseModel(this.Local_ID, this.Created, this.Updated, this.IsLocalRecord, this.IsActive);
}
