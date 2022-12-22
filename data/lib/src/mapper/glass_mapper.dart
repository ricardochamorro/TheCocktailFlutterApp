
import 'package:data/src/datasource/local/entity/glass_entity.dart';
import 'package:data/src/datasource/remote/dto/glass_response.dart';
import 'package:domain/domain.dart';

extension GlassExtension on Glass {
  GlassModel toModel() => GlassModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
  GlassEntity toEntity() =>  GlassEntity(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}

extension GlassEntityExtension on GlassEntity {
  GlassModel toModel() => GlassModel(Name, Local_ID: null, Created: 0, Updated: 0, IsLocalRecord: "N", IsActive: "Y");
}