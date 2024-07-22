import 'package:mobx/mobx.dart';

// Include generated file
part 'home_page_store.g.dart';

// This is the class used by rest of your codebase
class HomePageStore = HomePageStoreBase with _$HomePageStore;

// The store-class
abstract class HomePageStoreBase with Store {
  HomePageStoreBase();

  @observable
  int counter = 0;

  @action
  incrementCounter() {
    ++counter;
  }
}
