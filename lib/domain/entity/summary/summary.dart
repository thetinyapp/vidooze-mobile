import 'package:vidooze_mobile/data/dto/response/summarizer_response/summarizer_response.dart';

class Summary {
  final String title;
  final String summary;
  final String synopsis;
  final String id;
  final List<KeyMoment> keyMoments;

  Summary({
    required this.title,
    required this.summary,
    required this.synopsis,
    required this.keyMoments,
    required this.id,
  });

  factory Summary.fromSynopsisResponse(SynopsisResponse response) {
    return Summary(
      id: response.uuid,
      title: response.title,
      summary: response.summary,
      synopsis: response.synopsis,
      keyMoments: response.keyMoments
          .map((it) => KeyMoment.fromKeyMomentResponse(it))
          .toList(),
    );
  }
}

class KeyMoment {
  final String timestamp;

  final String title;

  final String id;

  KeyMoment({
    required this.timestamp,
    required this.title,
    required this.id,
  });

  factory KeyMoment.fromKeyMomentResponse(KeyMomentResponse response) {
    return KeyMoment(
      timestamp: response.timestamp,
      title: response.title,
      id: response.uuid,
    );
  }
}
