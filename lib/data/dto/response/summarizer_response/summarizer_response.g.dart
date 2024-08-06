// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summarizer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummarizerResponse _$SummarizerResponseFromJson(Map<String, dynamic> json) =>
    SummarizerResponse(
      synopsis:
          SynopsisResponse.fromJson(json['synopsis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummarizerResponseToJson(SummarizerResponse instance) =>
    <String, dynamic>{
      'synopsis': instance.synopsis,
    };

SynopsisResponse _$SynopsisResponseFromJson(Map<String, dynamic> json) =>
    SynopsisResponse(
      summary: json['summary'] as String,
      synopsis: json['synopsis'] as String,
      title: json['title'] as String,
      keyMoments: (json['keyMoments'] as List<dynamic>)
          .map((e) => KeyMomentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SynopsisResponseToJson(SynopsisResponse instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'synopsis': instance.synopsis,
      'title': instance.title,
      'keyMoments': instance.keyMoments,
    };

KeyMomentResponse _$KeyMomentResponseFromJson(Map<String, dynamic> json) =>
    KeyMomentResponse(
      timestamp: json['timestamp'] as String,
      title: json['title'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$KeyMomentResponseToJson(KeyMomentResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'title': instance.title,
      'uuid': instance.uuid,
    };
