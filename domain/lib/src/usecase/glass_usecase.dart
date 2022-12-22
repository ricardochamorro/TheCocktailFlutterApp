
import 'package:domain/domain.dart';
import 'package:domain/src/model/glass_model.dart';

import 'base/base_use_case.dart';

abstract class GetAllGlassesUseCase implements BaseUseCase {
  Stream<Resource<List<GlassModel>?>> getGlasses(bool forceRefresh);
}

abstract class GetGlassByNameUseCase implements BaseUseCase {
  Stream<Resource<GlassModel?>> getGlassByName(String name);
}
