import 'package:freezed_annotation/freezed_annotation.dart';

part 'summarizer_response.g.dart';

@JsonSerializable()
class SummarizerResponse {
  @JsonKey(name: "synopsis")
  final SynopsisResponse synopsis;

  SummarizerResponse({
    required this.synopsis,
  });

  factory SummarizerResponse.fromJson(Map<String, dynamic> json) =>
      _$SummarizerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SummarizerResponseToJson(this);
}

@JsonSerializable()
class SynopsisResponse {
  @JsonKey(name: "summary")
  final String summary;

  @JsonKey(name: "synopsis")
  final String synopsis;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "keyMoments")
  final List<KeyMomentResponse> keyMoments;

  SynopsisResponse({
    required this.summary,
    required this.synopsis,
    required this.title,
    required this.keyMoments,
  });

  factory SynopsisResponse.fromJson(Map<String, dynamic> json) =>
      _$SynopsisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SynopsisResponseToJson(this);
}

@JsonSerializable()
class KeyMomentResponse {
  @JsonKey(name: "timestamp")
  final String timestamp;

  @JsonKey(name: "title")
  final String title;

  KeyMomentResponse({
    required this.timestamp,
    required this.title,
  });

  factory KeyMomentResponse.fromJson(Map<String, dynamic> json) =>
      _$KeyMomentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KeyMomentResponseToJson(this);
}
