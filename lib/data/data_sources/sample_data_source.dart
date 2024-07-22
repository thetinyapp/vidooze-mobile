abstract class SampleDataSource {
  Future<bool> doSomething();
}

class SampleDataSourceImpl implements SampleDataSource {
  @override
  Future<bool> doSomething() {
    return Future.value(true);
  }
}
