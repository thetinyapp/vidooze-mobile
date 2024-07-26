import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:vidooze_mobile/data/data_sources/auth_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/error_reporting_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/token_data_source.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';
import 'package:vidooze_mobile/data/repository/auth_repository_impl.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';

final locator = GetIt.instance;

void configureDependencies() {
  _setupNetwork();
  _setupDataSource();
  _setupRepository();
}

void _setupDataSource() {
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      restClient: locator.get<RestClient>(),
    ),
  );
  locator.registerLazySingleton<TokenDataSource>(
    () => LocalTokenDataSource(
      storage: const FlutterSecureStorage(),
    ),
  );
  locator.registerLazySingleton<ErrorReportingDataSource>(
    () => FirebaseErrorReportingDataSource(),
  );
}

void _setupRepository() {
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: locator.get<AuthDataSource>(),
      tokenDataSource: locator.get<TokenDataSource>(),
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
    ),
  );
}

void _setupNetwork() {
  locator.registerLazySingleton<Dio>(
    () => buildClient(
      baseUrl: "https://api.npoint.io",
    ),
  );
  locator.registerLazySingleton(
    () => RestClient(
      locator.get<Dio>(),
    ),
  );
}
