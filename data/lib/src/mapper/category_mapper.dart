
import 'package:data/src/datasource/local/entity/category_entity.dart';
import 'package:data/src/datasource/remote/dto/category_response.dart';
import 'package:domain/domain.dart';

extension CategoryExtension on Category {
  CategoryModel toModel() => CategoryModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  CategoryEntity toEntity() =>  CategoryEntity(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension CategoryEntityExtension on CategoryEntity {
  CategoryModel toModel() => CategoryModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}