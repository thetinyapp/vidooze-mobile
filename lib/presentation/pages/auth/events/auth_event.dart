import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  factory AuthEvent.idle() = AuthIdle;

  factory AuthEvent.authorisationInProgress() = AuthorisationInProgress;

  factory AuthEvent.success() = AuthSuccess;

  factory AuthEvent.error(String message) = AuthError;
}
