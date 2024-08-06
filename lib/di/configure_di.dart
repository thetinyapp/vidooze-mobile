import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vidooze_mobile/data/data_sources/analytics_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/auth_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/error_reporting_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/firebase_app_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/summarizer_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/theme_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/token_data_source.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';
import 'package:vidooze_mobile/data/repository/analytics_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/app_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/auth_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/error_reporting_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/summarizer_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/theme_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/token_repository_impl.dart';
import 'package:vidooze_mobile/data/repository/user_repository_impl.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/app_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/domain/repository/error_reporting_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/domain/repository/theme_repository.dart';
import 'package:vidooze_mobile/domain/repository/token_repository.dart';
import 'package:vidooze_mobile/domain/repository/user_repository.dart';
import 'package:vidooze_mobile/env/env.dart';
import 'package:vidooze_mobile/presentation/app_store.dart';

final locator = GetIt.instance;

void configureDependencies() {
  _setupNetwork();
  _setupDataSource();
  _setupRepository();
  _setupStore();
}

void _setupStore() {
  locator.registerLazySingleton<AppStore>(
    () => AppStore(
      themeRepository: locator.get<ThemeRepository>(),
    ),
  );
}

void _setupDataSource() {
  locator.registerLazySingleton<ErrorReportingDataSource>(
    () => FirebaseErrorReportingDataSource(),
  );
  locator.registerLazySingleton<AppDataSource>(
    () => FirebaseAppDataSource(),
  );
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      restClient: locator.get<RestClient>(),
    ),
  );
  locator.registerLazySingleton<SummarizerDataSource>(
    () => SummarizerDataSourceImpl(
      restClient: locator.get<RestClient>(),
    ),
  );
  locator.registerLazySingleton<TokenDataSource>(
    () => LocalTokenDataSource(),
  );
  locator.registerLazySingleton<AnalyticsDataSource>(
    () => FirebaseAnalyticsDataSource(),
  );
  locator.registerLazySingleton<ThemeDataSource>(
    () => LocalThemeDataSource(),
  );
}

void _setupRepository() {
  locator.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      appDataSource: locator.get<AppDataSource>(),
    ),
  );
  locator.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
      themeDataSource: locator.get<ThemeDataSource>(),
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
    ),
  );
  locator.registerLazySingleton<ErrorReportingRepository>(
    () => ErrorReportingRepositoryImpl(
      dataSource: locator.get<ErrorReportingDataSource>(),
    ),
  );
  locator.registerLazySingleton<AnalyticsRepository>(
    () => AnalyticsRepositoryImpl(
      dataSource: locator.get<AnalyticsDataSource>(),
    ),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: locator.get<AuthDataSource>(),
      tokenDataSource: locator.get<TokenDataSource>(),
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
      tokenDataSource: locator.get<TokenDataSource>(),
    ),
  );
  locator.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
      tokenDataSource: locator.get<TokenDataSource>(),
    ),
  );
  locator.registerLazySingleton<SummarizerRepository>(
    () => SummarizerRepositoryImpl(
      errorReportingDataSource: locator.get<ErrorReportingDataSource>(),
      dataSource: locator.get<SummarizerDataSource>(),
    ),
  );
}

void _setupNetwork() {
  locator.registerLazySingleton<Dio>(
    () => buildClient(
      baseUrl: Env.apiUrl,
    ),
  );
  locator.registerLazySingleton(
    () => RestClient(
      locator.get<Dio>(),
    ),
  );
}
