import 'package:data/src/datasource/local/dao/alcoholic_filter_dao.dart';
import 'package:data/src/datasource/local/entity/alcoholic_filter_entity.dart';
import 'package:data/src/datasource/remote/dto/alcoholic_filter_response.dart';
import 'package:data/src/datasource/remote/service/alcoholic_filter_service.dart';
import 'package:data/src/mapper/alcoholic_filter_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'base/base_repository.dart';

@Injectable(as: AlcoholicFilterRepository)
class AlcoholicFilterRepositoryImpl extends BaseRepository
    implements AlcoholicFilterRepository {
  final AlcoholicFilterService _alcoholicFilterService;
  final AlcoholicFilterDao _alcoholicFilterDao;

  AlcoholicFilterRepositoryImpl(this._alcoholicFilterService, this._alcoholicFilterDao);

  @override
  Stream<Resource<AlcoholicFilterModel?>> getAlcoholicFilter(String name) {
    return getLocalData<AlcoholicFilterEntity, AlcoholicFilterModel>(
        loadFromDb: () => _alcoholicFilterDao.findAlcoholicFilterByName(name),
        map: (entity) => entity?.toModel());
  }

  @override
  Stream<Resource<List<AlcoholicFilterModel>?>> getAlcoholicFilters(bool forceRefresh) {
    if (forceRefresh)
      return getNetworkData<AlcoholicFilterResponse, List<AlcoholicFilterModel>>(
          createNetworkCall: () => _alcoholicFilterService.getAlcoholicFilters(),
          map: (response) =>
              response?.alcoholicFilters.map((e) => e.toModel()).toList());
    else
      return getNetworkBoundData<AlcoholicFilterResponse, List<AlcoholicFilterEntity>,
          List<AlcoholicFilterModel>>(
          loadFromDb: () => _alcoholicFilterDao.findAllAlcoholicFilters(),
          createNetworkCall: () => _alcoholicFilterService.getAlcoholicFilters(),
          map: (list) => list?.map((e) => e.toModel()).toList(),
          saveNetworkResult: (response) async {
            if (response != null) {
              await response.alcoholicFilters.map((e) => _alcoholicFilterDao.insertAlcoholFilter(e.toEntity()));
            }
          },
          onNetworkCallFailure: (ex) => {print('Network call failed: $ex')});
  }
}
