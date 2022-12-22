import 'package:domain/src/model/base_model.dart';

class CategoryModel extends BaseModel {
  late String Name;

  CategoryModel(this.Name,
      {required int? Local_ID, required int Created, required int Updated,
        required String IsLocalRecord, required String IsActive })
      : super(Local_ID,  Created, Updated,IsLocalRecord, IsActive);
}
