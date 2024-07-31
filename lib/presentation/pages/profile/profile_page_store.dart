import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/token_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

part 'profile_page_store.g.dart';

class ProfilePageStore extends _ProfilePageStore with _$ProfilePageStore {
  ProfilePageStore({
    required super.tokenRepository,
  });
}

abstract class _ProfilePageStore extends BasePageStore with Store {
  final TokenRepository _tokenRepository;

  _ProfilePageStore({
    required TokenRepository tokenRepository,
  }) : _tokenRepository = tokenRepository;

  Future<Result<Unit, BaseError>> clearToken() async {
    return await executeCall(() => _tokenRepository.clear());
  }
}
