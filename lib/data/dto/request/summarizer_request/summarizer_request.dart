import 'package:json_annotation/json_annotation.dart';

part 'summarizer_request.g.dart';

@JsonSerializable(createFactory: false)
class SummarizerRequest {
  @JsonKey(name: "videoUrl")
  final String videoUrl;

  SummarizerRequest({
    required this.videoUrl,
  });

  Map<String, dynamic> toJson() => _$SummarizerRequestToJson(this);
}
