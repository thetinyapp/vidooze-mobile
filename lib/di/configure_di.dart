import 'package:vidooze_mobile/data/data_sources/sample_data_source.dart';
import 'package:vidooze_mobile/data/repository/SampleRepositoryImpl.dart';
import 'package:vidooze_mobile/domain/repository/sample_repository.dart';
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
