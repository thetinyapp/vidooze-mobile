import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

// Include generated file
part 'auth_page_store.g.dart';

class AuthPageStore extends _AuthPageStore with _$AuthPageStore {
  AuthPageStore();
}

abstract class _AuthPageStore extends BasePageStore with Store {
  _AuthPageStore();
}
