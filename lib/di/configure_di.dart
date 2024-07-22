import 'package:flutter_starter_kit/data/data_sources/sample_data_source.dart';
import 'package:flutter_starter_kit/data/repository/SampleRepositoryImpl.dart';
import 'package:flutter_starter_kit/domain/repository/sample_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void configureDependencies() {
  _setupDataSource();
  _setupRepository();
}

void _setupDataSource() {
  locator.registerLazySingleton<SampleDataSource>(
    () => SampleDataSourceImpl(),
  );
}

void _setupRepository() {
  locator.registerLazySingleton<SampleRepository>(
    () => SampleRepositoryImpl(
      dataSource: locator.get<SampleDataSource>(),
    ),
  );
}
