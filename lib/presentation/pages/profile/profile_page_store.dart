import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

part 'profile_page_store.g.dart';

class ProfilePageStore extends _ProfilePageStore with _$ProfilePageStore {
  ProfilePageStore();
}

abstract class _ProfilePageStore extends BasePageStore with Store {}
