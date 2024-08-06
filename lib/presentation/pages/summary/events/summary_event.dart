import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vidooze_mobile/domain/entity/summary/summary.dart';

part 'summary_event.freezed.dart';

@freezed
sealed class SummaryEvent with _$SummaryEvent {
  factory SummaryEvent.inProgress() = InProgress;

  factory SummaryEvent.success(Summary data) = Success;

  factory SummaryEvent.error(String message) = Error;
}
