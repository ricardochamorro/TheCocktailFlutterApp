import 'package:data/src/datasource/local/dao/measure_dao.dart';
import 'package:data/src/datasource/local/entity/measure_entity.dart';
import 'package:data/src/datasource/remote/dto/measure_response.dart';
import 'package:data/src/datasource/remote/service/measure_service.dart';
import 'package:data/src/mapper/measure_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: MeasureRepository)
class MeasureRepositoryImpl extends BaseRepository
    implements MeasureRepository {
  final MeasureService _measureService;
  final MeasureDao _measureDao;

  MeasureRepositoryImpl(this._measureService, this._measureDao);

  @override
  Stream<Resource<MeasureModel?>> getMeasure(String name) {
    return getLocalData<MeasureEntity, MeasureModel>(
        loadFromDb: () => _measureDao.findMeasureByName(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<MeasureModel>?>> getMeasures(bool forceRefresh) {
    if (forceRefresh)
      return getNetworkData<MeasureResponse, List<MeasureModel>>(
          createNetworkCall: () => _measureService.getMeasures(),
          map: (response) =>
              response?.measures.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<MeasureResponse, List<MeasureEntity>,
          List<MeasureModel>>(
          loadFromDb: () => _measureDao.findAllMeasures(),
          createNetworkCall: () => _measureService.getMeasures(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await response.measures.map((e) => _measureDao.insertMeasure(e.toEntity()));
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }

}
