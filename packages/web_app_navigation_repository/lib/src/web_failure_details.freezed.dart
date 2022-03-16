// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_failure_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WebFailureDetailsTearOff {
  const _$WebFailureDetailsTearOff();

  _BadResponse badResponse(BadResponse details) {
    return _BadResponse(
      details,
    );
  }

  _TimeoutError timeoutError(Object error, StackTrace stackTrace) {
    return _TimeoutError(
      error,
      stackTrace,
    );
  }

  _NetworkProblem networkProblem(Object error, StackTrace stackTrace) {
    return _NetworkProblem(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $WebFailureDetails = _$WebFailureDetailsTearOff();

/// @nodoc
mixin _$WebFailureDetails {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BadResponse details) badResponse,
    required TResult Function(Object error, StackTrace stackTrace) timeoutError,
    required TResult Function(Object error, StackTrace stackTrace)
        networkProblem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_TimeoutError value) timeoutError,
    required TResult Function(_NetworkProblem value) networkProblem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebFailureDetailsCopyWith<$Res> {
  factory $WebFailureDetailsCopyWith(
          WebFailureDetails value, $Res Function(WebFailureDetails) then) =
      _$WebFailureDetailsCopyWithImpl<$Res>;
}

/// @nodoc
class _$WebFailureDetailsCopyWithImpl<$Res>
    implements $WebFailureDetailsCopyWith<$Res> {
  _$WebFailureDetailsCopyWithImpl(this._value, this._then);

  final WebFailureDetails _value;
  // ignore: unused_field
  final $Res Function(WebFailureDetails) _then;
}

/// @nodoc
abstract class _$BadResponseCopyWith<$Res> {
  factory _$BadResponseCopyWith(
          _BadResponse value, $Res Function(_BadResponse) then) =
      __$BadResponseCopyWithImpl<$Res>;
  $Res call({BadResponse details});
}

/// @nodoc
class __$BadResponseCopyWithImpl<$Res>
    extends _$WebFailureDetailsCopyWithImpl<$Res>
    implements _$BadResponseCopyWith<$Res> {
  __$BadResponseCopyWithImpl(
      _BadResponse _value, $Res Function(_BadResponse) _then)
      : super(_value, (v) => _then(v as _BadResponse));

  @override
  _BadResponse get _value => super._value as _BadResponse;

  @override
  $Res call({
    Object? details = freezed,
  }) {
    return _then(_BadResponse(
      details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as BadResponse,
    ));
  }
}

/// @nodoc

class _$_BadResponse implements _BadResponse {
  const _$_BadResponse(this.details);

  @override
  final BadResponse details;

  @override
  String toString() {
    return 'WebFailureDetails.badResponse(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BadResponse &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$BadResponseCopyWith<_BadResponse> get copyWith =>
      __$BadResponseCopyWithImpl<_BadResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BadResponse details) badResponse,
    required TResult Function(Object error, StackTrace stackTrace) timeoutError,
    required TResult Function(Object error, StackTrace stackTrace)
        networkProblem,
  }) {
    return badResponse(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
  }) {
    return badResponse?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_TimeoutError value) timeoutError,
    required TResult Function(_NetworkProblem value) networkProblem,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }
}

abstract class _BadResponse implements WebFailureDetails {
  const factory _BadResponse(BadResponse details) = _$_BadResponse;

  BadResponse get details;
  @JsonKey(ignore: true)
  _$BadResponseCopyWith<_BadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TimeoutErrorCopyWith<$Res> {
  factory _$TimeoutErrorCopyWith(
          _TimeoutError value, $Res Function(_TimeoutError) then) =
      __$TimeoutErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$TimeoutErrorCopyWithImpl<$Res>
    extends _$WebFailureDetailsCopyWithImpl<$Res>
    implements _$TimeoutErrorCopyWith<$Res> {
  __$TimeoutErrorCopyWithImpl(
      _TimeoutError _value, $Res Function(_TimeoutError) _then)
      : super(_value, (v) => _then(v as _TimeoutError));

  @override
  _TimeoutError get _value => super._value as _TimeoutError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_TimeoutError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$_TimeoutError implements _TimeoutError {
  const _$_TimeoutError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'WebFailureDetails.timeoutError(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeoutError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$TimeoutErrorCopyWith<_TimeoutError> get copyWith =>
      __$TimeoutErrorCopyWithImpl<_TimeoutError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BadResponse details) badResponse,
    required TResult Function(Object error, StackTrace stackTrace) timeoutError,
    required TResult Function(Object error, StackTrace stackTrace)
        networkProblem,
  }) {
    return timeoutError(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
  }) {
    return timeoutError?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
    required TResult orElse(),
  }) {
    if (timeoutError != null) {
      return timeoutError(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_TimeoutError value) timeoutError,
    required TResult Function(_NetworkProblem value) networkProblem,
  }) {
    return timeoutError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
  }) {
    return timeoutError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
    required TResult orElse(),
  }) {
    if (timeoutError != null) {
      return timeoutError(this);
    }
    return orElse();
  }
}

abstract class _TimeoutError implements WebFailureDetails {
  const factory _TimeoutError(Object error, StackTrace stackTrace) =
      _$_TimeoutError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$TimeoutErrorCopyWith<_TimeoutError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NetworkProblemCopyWith<$Res> {
  factory _$NetworkProblemCopyWith(
          _NetworkProblem value, $Res Function(_NetworkProblem) then) =
      __$NetworkProblemCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$NetworkProblemCopyWithImpl<$Res>
    extends _$WebFailureDetailsCopyWithImpl<$Res>
    implements _$NetworkProblemCopyWith<$Res> {
  __$NetworkProblemCopyWithImpl(
      _NetworkProblem _value, $Res Function(_NetworkProblem) _then)
      : super(_value, (v) => _then(v as _NetworkProblem));

  @override
  _NetworkProblem get _value => super._value as _NetworkProblem;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_NetworkProblem(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$_NetworkProblem implements _NetworkProblem {
  const _$_NetworkProblem(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'WebFailureDetails.networkProblem(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkProblem &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$NetworkProblemCopyWith<_NetworkProblem> get copyWith =>
      __$NetworkProblemCopyWithImpl<_NetworkProblem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BadResponse details) badResponse,
    required TResult Function(Object error, StackTrace stackTrace) timeoutError,
    required TResult Function(Object error, StackTrace stackTrace)
        networkProblem,
  }) {
    return networkProblem(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
  }) {
    return networkProblem?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BadResponse details)? badResponse,
    TResult Function(Object error, StackTrace stackTrace)? timeoutError,
    TResult Function(Object error, StackTrace stackTrace)? networkProblem,
    required TResult orElse(),
  }) {
    if (networkProblem != null) {
      return networkProblem(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_TimeoutError value) timeoutError,
    required TResult Function(_NetworkProblem value) networkProblem,
  }) {
    return networkProblem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
  }) {
    return networkProblem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_TimeoutError value)? timeoutError,
    TResult Function(_NetworkProblem value)? networkProblem,
    required TResult orElse(),
  }) {
    if (networkProblem != null) {
      return networkProblem(this);
    }
    return orElse();
  }
}

abstract class _NetworkProblem implements WebFailureDetails {
  const factory _NetworkProblem(Object error, StackTrace stackTrace) =
      _$_NetworkProblem;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$NetworkProblemCopyWith<_NetworkProblem> get copyWith =>
      throw _privateConstructorUsedError;
}
