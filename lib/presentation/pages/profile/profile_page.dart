import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/pages/profile/profile_page_store.dart';

@RoutePage()
class ProfilePage extends BaseStatefulPageWidget<ProfilePageStore> {
  const ProfilePage({super.key}) : super(pageName: "Profile");

  @override
  BasePageState<ProfilePageStore> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePageStore> {
  @override
  Widget buildBody(BuildContext context, ProfilePageStore store) {
    return Container();
  }

  @override
  ProfilePageStore createStore() => ProfilePageStore();
}
