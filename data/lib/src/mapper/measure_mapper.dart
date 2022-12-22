
import 'package:data/src/datasource/local/entity/measure_entity.dart';
import 'package:data/src/datasource/remote/dto/measure_response.dart';
import 'package:domain/domain.dart';

extension Extension on Measure {
  MeasureModel toModel() => MeasureModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  MeasureEntity toEntity() =>  MeasureEntity(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension MeasureEntityExtension on MeasureEntity {
  MeasureModel toModel() => MeasureModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}