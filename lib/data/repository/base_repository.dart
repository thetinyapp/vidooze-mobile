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

  Future<Result<T, E>> parseOrError<T extends Object, E extends BaseError>(
    Future<T> Function() parseFunction,
  ) async {
    try {
      final result = await parseFunction();
      return Result.success(result);
    } on UnauthorizedException catch (e) {
      final error = UnauthorisedError(e.toString()) as E;
      return Result.failure(error);
    } on BaseException catch (e) {
      _errorReportingDataSource.reportError();
      final error = UnknownError(e.toString()) as E;
      return Result.failure(error);
    } catch (e) {
      _errorReportingDataSource.reportError();
      final error = UnknownError(e.toString()) as E;
      return Result.failure(error);
    }
  }
}
