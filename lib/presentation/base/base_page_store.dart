import 'package:flutter_starter_kit/domain/models/error.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';

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
