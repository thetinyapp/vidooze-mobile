import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class BasePageStore with Store {
  @observable
  bool isUnAuthorised = false;

  init() {}

  dispose() {}

  Future<Result<T, BaseError>> executeApiCall<T extends Object>(
      Future<Result<T, BaseError>> Function() apiCall) async {
    try {
      final result = await apiCall();
      result.onFailure((failure) {
        if (failure is UnAuthorisedError) {
          isUnAuthorised = true;
        }
      });
      return result;
    } catch (e) {
      return Result.failure(UnknownError(e.toString()));
    }
  }
}
