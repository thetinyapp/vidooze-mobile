import 'package:flutter_starter_kit/data/data_sources/sample_data_source.dart';
import 'package:flutter_starter_kit/domain/repository/sample_repository.dart';

class SampleRepositoryImpl implements SampleRepository {
  final SampleDataSource _dataSource;

  SampleRepositoryImpl({
    required SampleDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<bool> doSomething() async {
    return await _dataSource.doSomething();
  }
}
