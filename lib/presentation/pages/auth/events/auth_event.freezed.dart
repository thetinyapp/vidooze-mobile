// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() authorisationInProgress,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? authorisationInProgress,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? authorisationInProgress,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle value) idle,
    required TResult Function(AuthorisationInProgress value)
        authorisationInProgress,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle value)? idle,
    TResult? Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle value)? idle,
    TResult Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthIdleImplCopyWith<$Res> {
  factory _$$AuthIdleImplCopyWith(
          _$AuthIdleImpl value, $Res Function(_$AuthIdleImpl) then) =
      __$$AuthIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthIdleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthIdleImpl>
    implements _$$AuthIdleImplCopyWith<$Res> {
  __$$AuthIdleImplCopyWithImpl(
      _$AuthIdleImpl _value, $Res Function(_$AuthIdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthIdleImpl implements AuthIdle {
  _$AuthIdleImpl();

  @override
  String toString() {
    return 'AuthEvent.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() authorisationInProgress,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? authorisationInProgress,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? authorisationInProgress,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle value) idle,
    required TResult Function(AuthorisationInProgress value)
        authorisationInProgress,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle value)? idle,
    TResult? Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle value)? idle,
    TResult Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AuthIdle implements AuthEvent {
  factory AuthIdle() = _$AuthIdleImpl;
}

/// @nodoc
abstract class _$$AuthorisationInProgressImplCopyWith<$Res> {
  factory _$$AuthorisationInProgressImplCopyWith(
          _$AuthorisationInProgressImpl value,
          $Res Function(_$AuthorisationInProgressImpl) then) =
      __$$AuthorisationInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorisationInProgressImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthorisationInProgressImpl>
    implements _$$AuthorisationInProgressImplCopyWith<$Res> {
  __$$AuthorisationInProgressImplCopyWithImpl(
      _$AuthorisationInProgressImpl _value,
      $Res Function(_$AuthorisationInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorisationInProgressImpl implements AuthorisationInProgress {
  _$AuthorisationInProgressImpl();

  @override
  String toString() {
    return 'AuthEvent.authorisationInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorisationInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() authorisationInProgress,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return authorisationInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? authorisationInProgress,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return authorisationInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? authorisationInProgress,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authorisationInProgress != null) {
      return authorisationInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle value) idle,
    required TResult Function(AuthorisationInProgress value)
        authorisationInProgress,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
  }) {
    return authorisationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle value)? idle,
    TResult? Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
  }) {
    return authorisationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle value)? idle,
    TResult Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (authorisationInProgress != null) {
      return authorisationInProgress(this);
    }
    return orElse();
  }
}

abstract class AuthorisationInProgress implements AuthEvent {
  factory AuthorisationInProgress() = _$AuthorisationInProgressImpl;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSuccessImpl implements AuthSuccess {
  _$AuthSuccessImpl();

  @override
  String toString() {
    return 'AuthEvent.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() authorisationInProgress,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? authorisationInProgress,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? authorisationInProgress,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle value) idle,
    required TResult Function(AuthorisationInProgress value)
        authorisationInProgress,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle value)? idle,
    TResult? Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle value)? idle,
    TResult Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess implements AuthEvent {
  factory AuthSuccess() = _$AuthSuccessImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  _$AuthErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthEvent.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() authorisationInProgress,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? authorisationInProgress,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? authorisationInProgress,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle value) idle,
    required TResult Function(AuthorisationInProgress value)
        authorisationInProgress,
    required TResult Function(AuthSuccess value) success,
    required TResult Function(AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle value)? idle,
    TResult? Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult? Function(AuthSuccess value)? success,
    TResult? Function(AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle value)? idle,
    TResult Function(AuthorisationInProgress value)? authorisationInProgress,
    TResult Function(AuthSuccess value)? success,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthEvent {
  factory AuthError(final String message) = _$AuthErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
