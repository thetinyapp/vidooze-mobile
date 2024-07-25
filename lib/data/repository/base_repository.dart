import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/data/data_sources/error_reporting_data_source.dart';
import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';
import 'package:vidooze_mobile/data/dto/exception/unauthorized_exception.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

class BaseRepository {
  final ErrorReportingDataSource _errorReportingDataSource;

  BaseRepository({
    required ErrorReportingDataSource errorReportingDataSource,
  }) : _errorReportingDataSource = errorReportingDataSource;

  Future<Result<T, F>> parseOrError<T extends Object, F extends BaseError>(
    Future<T> Function() parseFunction,
  ) async {
    try {
      final result = await parseFunction();
      return Result.success(result);
    } on UnauthorizedException catch (e) {
      final error = UnauthorisedError(e.toString()) as F;
      return Result.failure(error);
    } on BaseException catch (e) {
      _errorReportingDataSource.reportError();
      final error = UnknownError(e.toString()) as F;
      return Result.failure(error);
    } catch (e) {
      _errorReportingDataSource.reportError();
      final error = UnknownError(e.toString()) as F;
      return Result.failure(error);
    }
  }
}
