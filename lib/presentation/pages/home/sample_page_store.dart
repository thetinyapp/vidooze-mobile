import 'package:flutter_starter_kit/presentation/base/base_page_store.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'sample_page_store.g.dart';

class SamplePageStore extends _SamplePageStore with _$SamplePageStore {
  SamplePageStore({
    required super.initialCount,
  });
}

abstract class _SamplePageStore extends BasePageStore with Store {
  @observable
  int counter = 0;

  _SamplePageStore({required int initialCount}) : counter = initialCount;

  @action
  incrementCounter() {
    ++counter;
  }
}
