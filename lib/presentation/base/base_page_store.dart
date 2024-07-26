import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class BasePageStore with Store {
  @observable
  bool isUnAuthorised = false;

  init() {}

  dispose() {}

  Future<Result<T, E>> executeApiCall<T extends Object, E extends BaseError>(
      Future<Result<T, E>> Function() apiCall) async {
    try {
      final result = await apiCall();
      result.onFailure((failure) {
        if (failure is UnauthorisedError) {
          isUnAuthorised = true;
        }
      });
      return result;
    } catch (e) {
      final error = UnknownError(e.toString()) as E;
      return Result.failure(error);
    }
  }
}
