
import 'package:data/src/datasource/local/entity/alcoholic_filter_entity.dart';
import 'package:data/src/datasource/remote/dto/alcoholic_filter_response.dart';
import 'package:domain/domain.dart';

extension AlcoholicFilterExtension on AlcoholicFilter {
  AlcoholicFilterModel toModel() => AlcoholicFilterModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  AlcoholicFilterEntity toEntity() =>  AlcoholicFilterEntity(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension AlcoholicFilterEntityExtension on AlcoholicFilterEntity {
  AlcoholicFilterModel toModel() => AlcoholicFilterModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}