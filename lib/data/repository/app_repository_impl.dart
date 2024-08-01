import 'package:vidooze_mobile/data/data_sources/firebase_app_data_source.dart';
import 'package:vidooze_mobile/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDataSource _appDataSource;

  AppRepositoryImpl({
    required AppDataSource appDataSource,
  }) : _appDataSource = appDataSource;

  @override
  Future init() => _appDataSource.init();
}
