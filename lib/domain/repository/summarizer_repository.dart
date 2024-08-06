import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/entity/summary/summary.dart';

abstract class SummarizerRepository<E extends BaseError> {
  Future<Result<Summary, E>> summarize({
    required String videoUrl,
  });
}
