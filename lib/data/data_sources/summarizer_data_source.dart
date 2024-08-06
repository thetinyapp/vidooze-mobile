import 'package:vidooze_mobile/data/data_sources/base_remote_data_source.dart';
import 'package:vidooze_mobile/data/dto/exception/signup_exception.dart';
import 'package:vidooze_mobile/data/dto/request/summarizer_request/summarizer_request.dart';
import 'package:vidooze_mobile/data/dto/response/api_response/api_response.dart';
import 'package:vidooze_mobile/data/dto/response/summarizer_response/summarizer_response.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';
import 'package:vidooze_mobile/data/parsers/error_parser.dart';

abstract class SummarizerDataSource {
  Future<ApiResponse<SummarizerResponse>> summarize({
    required SummarizerRequest request,
  });
}

class SummarizerDataSourceImpl extends BaseRemoteDataSource
    implements SummarizerDataSource {
  final RestClient _restClient;

  SummarizerDataSourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<ApiResponse<SummarizerResponse>> summarize({
    required SummarizerRequest request,
  }) async {
    try {
      return await _restClient.summarize(request);
    } catch (e, s) {
      throw parseError<SignupException>(e, s, parseSignupException);
    }
  }
}
