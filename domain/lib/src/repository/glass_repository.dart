import 'package:domain/domain.dart';
import 'package:domain/src/model/glass_model.dart';

abstract class GlassRepository {
  Stream<Resource<List<GlassModel>?>> getGlasses(bool forceRefresh);
  Stream<Resource<GlassModel?>> getGlass(String name);
}
