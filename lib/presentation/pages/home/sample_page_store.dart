import 'package:flutter_starter_kit/domain/models/error.dart';
import 'package:flutter_starter_kit/presentation/base/base_page_store.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';

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

  void sampleApiCall() async {
    final result = await executeApiCall(() async {
      // Simulating an API call
      await Future.delayed(const Duration(seconds: 1));
      if (counter == 2) {
        return Result.failure(UnAuthorisedError("Unauthorized access"));
      }
      return Result.success(counter + 1);
    });
  }
}
