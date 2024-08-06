import 'package:result_dart/src/result.dart';
import 'package:vidooze_mobile/data/data_sources/summarizer_data_source.dart';
import 'package:vidooze_mobile/data/dto/request/summarizer_request/summarizer_request.dart';
import 'package:vidooze_mobile/data/repository/base_repository.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/entity/summary/summary.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';

class SummarizerRepositoryImpl extends BaseRepository
    implements SummarizerRepository {
  final SummarizerDataSource _dataSource;

  SummarizerRepositoryImpl({
    required final SummarizerDataSource dataSource,
    required super.errorReportingDataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Result<Summary, BaseError>> summarize({
    required String videoUrl,
  }) async {
    return await parseOrError(() async {
      final response = await _dataSource.summarize(
        request: SummarizerRequest(videoUrl: videoUrl),
      );
      return Summary.fromSynopsisResponse(response.data.synopsis);
    });
  }
}
