import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:floor/floor.dart';

typedef DtoToModelMap<Dto, Model> = Model? Function(Dto? dto);
typedef EntityToModelMap<Entity, Model> = Model? Function(Entity? entity);

typedef LoadFromDB<Entity> = Future<Entity?> Function();
typedef CreateNetworkCall<Dto> = Future<Dto?> Function();
typedef ShouldRefresh<Entity> = bool Function(Entity? entity);
typedef SaveNetworkResult<Dto> = Future<void> Function(Dto? dto);
typedef OnNetworkCallFailure = Function(Exception);

typedef SaveToDB<int> = Future<int?> Function();
typedef ShouldSaveOnServer<Entity> = bool Function(Entity? entity);
typedef CreateNetworkSaveCall<int> = Future<int?> Function();
typedef SaveNetworkSaveResult<int> = Future<void> Function(int? id);

typedef SaveToDB1<int> = Future<int> Function();

abstract class BaseRepository {

  Stream<Resource<int>> saveLocalData1(
      {required SaveToDB1 saveToDB}) async* {
    print('saveLocalData1: Saving to local storage...');
    yield* emit(Resource.loading(null));

    final resource = await _safeDatabaseSaveCall1(saveToDB.call());
    if (resource.status == Status.SUCCESS) {
      print('getLocalData: local storage call successful!');
      yield* emit(Resource.success(resource.data));
    } else {
      print('getLocalData: local storage call failed!');
      yield* emit(Resource.from(resource));
    }
  }


  Future<Resource<int>> _safeDatabaseSaveCall1<T>(Future<T?> call) async {
    try {
      final response = await call;
      if (response != null) {
        print("Get from DB successful!");
        return Resource.success(response);
      } else {
        print("Get from DB response is null");
        return Resource.failure(
            FailureDetails(message: "DB response is null!"));
      }
    } on Exception catch (e) {
      print("Get from DB failure message -> $e");
      return Resource.exception(ExceptionDetails(e));
    }
  }

  Stream<Resource<Model?>> getLocalData<Entity, Model>(
      {required LoadFromDB<Entity> loadFromDb,
      required EntityToModelMap<Entity, Model> map}) async* {
    print('getLocalData: loading from local storage...');
    yield* emit(Resource.loading(null));

    final resource = await _safeDatabaseCall(loadFromDb.call());
    if (resource.status == Status.SUCCESS) {
      print('getLocalData: local storage call successful!');
      yield* emit(Resource.success(map(resource.data)!));
    } else {
      print('getLocalData: local storage call failed!');
      yield* emit(Resource.from(resource));
    }
  }

  Stream<Resource<Model?>> getNetworkData<Dto, Model>(
      {required CreateNetworkCall<Dto> createNetworkCall,
      required DtoToModelMap<Dto, Model> map}) async* {
    print('getNetworkData: loading from network...');
    yield* emit(Resource.loading(null));

    final resource = await _safeNetworkCall(createNetworkCall.call());
    if (resource.status == Status.SUCCESS) {
      print('getNetworkData: network call successful');
      yield* emit(Resource.success(map(resource.data!)));
    } else {
      print('getNetworkData: network call failed');
      yield* emit(Resource.from(resource));
    }
  }

  Stream<Resource<Model?>> getNetworkBoundData<Dto, Entity, Model>(
      {required LoadFromDB<Entity> loadFromDb,
      required CreateNetworkCall<Dto> createNetworkCall,
      required EntityToModelMap<Entity, Model> map,
      required SaveNetworkResult<Dto> saveNetworkResult,
      ShouldRefresh<Entity>? shouldRefresh,
      OnNetworkCallFailure? onNetworkCallFailure}) async* {
    print('getNetworkBoundData: Loading data from DB...');
    yield* emit(Resource.loading(null));

    /// first try to get data from db
    final dbResource = await _safeDatabaseCall<Entity>(loadFromDb.call());

    /// check if we need to fetch latest data from network or not
    if (shouldRefresh?.call(dbResource.data) ?? true) {
      /// return db data if we have
      print('getNetworkBoundData: data found in DB, loading from network...');
      yield* emit(Resource.loading(map(dbResource.data)));

      /// load data from network
      final networkResource =
          await _safeNetworkCall<Dto>(createNetworkCall.call());
      switch (networkResource.status) {
        case Status.LOADING:
          print('getNetworkBoundData: loading from network...');
          break;
        case Status.SUCCESS:

          /// save network result
          await saveNetworkResult.call(networkResource.data);

          /// get latest data from db
          final newDbResource =
              await _safeDatabaseCall<Entity>(loadFromDb.call());
          yield* emit(Resource.fromMap(newDbResource, map(newDbResource.data)));
          break;
        case Status.EXCEPTION:

          /// send exception details to network call failure callback
          onNetworkCallFailure
              ?.call(networkResource.exceptionDetails!.exception);

          /// get latest data from db
          final newDbResource =
              await _safeDatabaseCall<Entity>(loadFromDb.call());
          yield* emit(Resource.fromMap(newDbResource, map(newDbResource.data)));
          break;
        case Status.FAILURE:

          /// send failure details to network call failure callback
          onNetworkCallFailure
              ?.call(Exception(networkResource.failureDetails!.message));

          /// get latest data from db
          final newDbResource =
              await _safeDatabaseCall<Entity>(loadFromDb.call());
          yield* emit(Resource.fromMap(newDbResource, map(newDbResource.data)));
          break;
      }
    } else {
      print('getNetworkBoundData: returning data from DB!');
      yield* emit(Resource.fromMap(dbResource, map(dbResource.data)));
    }
  }

  Future<Resource<T>> _safeDatabaseCall<T>(Future<T?> call) async {
    try {
      final response = await call;
      if (response != null) {
        print("Get from DB successful!");
        return Resource.success(response);
      } else {
        print("Get from DB response is null");
        return Resource.failure(
            FailureDetails(message: "DB response is null!"));
      }
    } on Exception catch (e) {
      print("Get from DB failure message -> $e");
      return Resource.exception(ExceptionDetails(e));
    }
  }

  Future<Resource<T>> _safeNetworkCall<T>(Future<T?> call) async {
    try {
      var response = await call;
      print("Network success message -> $response");
      return Resource.success(response);
    } on Exception catch (exception) {
      print("Network error message -> ${exception.toString()}");
      if (exception is DioError) {
        switch ((exception).type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Resource.failure(
                FailureDetails(message: "Poor network connection"));

          case DioErrorType.other:
            return Resource.failure(
                FailureDetails(message: "Internet not available!"));

          case DioErrorType.response:
            return Resource.failure(FailureDetails(
                httpCode: exception.response!.statusCode,
                message: exception.response!.data));
        }
      } else {
        return Resource.exception(ExceptionDetails(exception));
      }
    }
  }

  Stream<T> emit<T>(T data) => Stream.value(data);


  Future<Resource<int>> _safeDatabaseSaveCall<T>(Future<T?> call) async {
    try {
      final response = await call;
      if (response != null) {
        print("Save to DB successful!");
        return Resource.success(response);
      } else {
        print("Save to DB response is null");
        return Resource.failure(
            FailureDetails(message: "DB response is null!"));
      }
    } on Exception catch (e) {
      print("Save to DB failure message -> $e");
      return Resource.exception(ExceptionDetails(e));
    }
  }

  Future<Resource<T>> _safeNetworkSaveCall<T>(Future<T?> call) async {
    try {
      var response = await call;
      print("Save to Network success message -> $response");
      return Resource.success(response);
    } on Exception catch (exception) {
      print("Save to Network error message -> ${exception.toString()}");
      if (exception is DioError) {
        switch ((exception).type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Resource.failure(
                FailureDetails(message: "Poor network connection"));

          case DioErrorType.other:
            return Resource.failure(
                FailureDetails(message: "Internet not available!"));

          case DioErrorType.response:
            return Resource.failure(FailureDetails(
                httpCode: exception.response!.statusCode,
                message: exception.response!.data));
        }
      } else {
        return Resource.exception(ExceptionDetails(exception));
      }
    }
  }

  Stream<Resource<int>> storeDataToLocal<Entity, Model>(
      {required SaveToDB<Entity> saveToDB}) async* {
    print('storeDataToLocal: Store Data to local storage...');
    yield* emit(Resource.loading(null));

    final resource = await _safeDatabaseSaveCall(saveToDB.call());
    if (resource.status == Status.SUCCESS) {
      print('storeDataToLocal: Store Data to local storage successful!');
      yield* emit(Resource.success(resource.data));
    } else {
      print('storeDataToLocal: Store Data to local storage failed!');
      yield* emit(Resource.from(resource));
    }
  }

  Stream<Resource<int>> storeOnServer<Dto, Model>(
      {required CreateNetworkCall<Dto> createNetworkCall}) async* {
    print('storeOnServer: loading from network...');
    yield* emit(Resource.loading(null));

    final resource = await _safeNetworkSaveCall(createNetworkCall.call());
    if (resource.status == Status.SUCCESS) {
      print('storeOnServer: network call successful');
      yield* emit(Resource.success(resource.data));
    } else {
      throw Exception('storeOnServer: network call failed');
      print('storeOnServer: network call failed');
      yield* emit(Resource.from(resource));
    }
  }

  Stream<Resource<int>> storeNetworkBoundData<int, Entity, Model>(
      {required SaveToDB<int> saveToDB,
        required CreateNetworkSaveCall<int> createNetworkCall,
        required SaveNetworkSaveResult<int> saveNetworkResult,
        ShouldSaveOnServer<int>? shouldSaveOnServer,
        OnNetworkCallFailure? onNetworkCallFailure}) async* {
    print('storeNetworkBoundData: Saving data to DB...');
    yield* emit(Resource.loading(null));

    /// first try to get data from db
    final dbResource = await _safeDatabaseSaveCall(saveToDB.call());

    print('storeDataToLocal: Store Data to local storage...');
    yield* emit(Resource.loading(null));


    /// check if we need to fetch latest data from network or not
    if (shouldSaveOnServer?.call(dbResource.data as int) ?? true) {
      /// return db data if we have
      print('getNetworkBoundData: data found in DB, loading from network...');
      yield* emit(Resource.loading(dbResource.data));

      /// save data to network
      final networkResource =
      await _safeNetworkSaveCall<int>(createNetworkCall.call());
      switch (networkResource.status) {
        case Status.LOADING:
          print('storeNetworkBoundData: Saving on Server...');
          break;
        case Status.SUCCESS:

        /// save network result
          await saveNetworkResult.call(networkResource.data);

          /// get latest data from db
          final newDbResource =
          await _safeDatabaseSaveCall<int>(saveToDB.call());
          yield* emit(Resource.fromMap(newDbResource, newDbResource.data));
          break;
        case Status.EXCEPTION:

        /// send exception details to network call failure callback
          onNetworkCallFailure
              ?.call(networkResource.exceptionDetails!.exception);

          /// get latest data from db
          final newDbResource =
          await _safeDatabaseSaveCall<int>(saveToDB.call());
          yield* emit(Resource.fromMap(newDbResource, newDbResource.data));
          break;
        case Status.FAILURE:

        /// send failure details to network call failure callback
          onNetworkCallFailure
              ?.call(Exception(networkResource.failureDetails!.message));

          /// get latest data from db
          final newDbResource =
          await _safeDatabaseCall<int>(saveToDB.call());
          yield* emit(Resource.fromMap(newDbResource, newDbResource.data));
          break;
      }
    } else {
      print('getNetworkBoundData: returning data from DB!');
      yield* emit(Resource.fromMap(dbResource, dbResource.data));
    }
  }
}
