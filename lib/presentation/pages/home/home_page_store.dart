import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

// Include generated file
part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {
  HomePageStore();
}

abstract class _HomePageStore extends BasePageStore with Store {
  _HomePageStore();
}
