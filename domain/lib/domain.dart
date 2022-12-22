library domain;

export 'package:domain/src/common/status.dart';
export 'package:domain/src/common/resource.dart';
export 'package:domain/src/common/error_type.dart';

export 'package:domain/src/model/alcoholic_filter_model.dart';
export 'package:domain/src/model/category_model.dart';
export 'package:domain/src/model/drink_ingredient_model.dart';
export 'package:domain/src/model/drink_model.dart';
export 'package:domain/src/model/glass_model.dart';
export 'package:domain/src/model/ingredient_model.dart';
export 'package:domain/src/model/measure_model.dart';

export 'package:domain/src/repository/alcoholic_filter_repository.dart';
export 'package:domain/src/repository/category_repository.dart';
export 'package:domain/src/repository/drink_repository.dart';
export 'package:domain/src/repository/drink_ingredient_repository.dart';
export 'package:domain/src/repository/glass_repository.dart';
export 'package:domain/src/repository/measure_repository.dart';
export 'package:domain/src/repository/ingredient_repository.dart';

export 'package:domain/src/usecase/alcoholic_filter_usecase.dart';
export 'package:domain/src/usecase/category_usecase.dart';
export 'package:domain/src/usecase/drink_usecase.dart';
export 'package:domain/src/usecase/drink_ingredient_usecase.dart';
export 'package:domain/src/usecase/glass_usecase.dart';
export 'package:domain/src/usecase/measure_usecase.dart';
export 'package:domain/src/usecase/ingredient_usecase.dart';

import 'package:domain/src/di/locator.dart';

class Domain {
  static Future<void> init() async {
    await setupLocator();
  }
}