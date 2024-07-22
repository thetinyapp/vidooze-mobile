import 'package:flutter_starter_kit/presentation/base/base_page_store.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'home_page_store.g.dart';

// This is the class used by rest of your codebase
class HomePageStore = _HomePageStore with _$HomePageStore;

// The store-class
abstract class _HomePageStore extends BasePageStore with Store {
  _HomePageStore();

  @observable
  int counter = 0;

  @action
  incrementCounter() {
    ++counter;
  }
}
