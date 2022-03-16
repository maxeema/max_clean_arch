// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _DetailedReason<R> detailed<R extends FailureDetails>(R reason) {
    return _DetailedReason<R>(
      reason,
    );
  }

  _EmptyData<R> emptyData<R extends FailureDetails>() {
    return _EmptyData<R>();
  }

  _DataIntegrityError<R> dataIntegrity<R extends FailureDetails>(
      Object error, StackTrace stackTrace) {
    return _DataIntegrityError<R>(
      error,
      stackTrace,
    );
  }

  _UnknownError<R> unknown<R extends FailureDetails>(
      Object error, StackTrace stackTrace) {
    return _UnknownError<R>(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure<R extends FailureDetails> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R reason) detailed,
    required TResult Function() emptyData,
    required TResult Function(Object error, StackTrace stackTrace)
        dataIntegrity,
    required TResult Function(Object error, StackTrace stackTrace) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailedReason<R> value) detailed,
    required TResult Function(_EmptyData<R> value) emptyData,
    required TResult Function(_DataIntegrityError<R> value) dataIntegrity,
    required TResult Function(_UnknownError<R> value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<R extends FailureDetails, $Res> {
  factory $FailureCopyWith(Failure<R> value, $Res Function(Failure<R>) then) =
      _$FailureCopyWithImpl<R, $Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<R extends FailureDetails, $Res>
    implements $FailureCopyWith<R, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure<R> _value;
  // ignore: unused_field
  final $Res Function(Failure<R>) _then;
}

/// @nodoc
abstract class _$DetailedReasonCopyWith<R extends FailureDetails, $Res> {
  factory _$DetailedReasonCopyWith(
          _DetailedReason<R> value, $Res Function(_DetailedReason<R>) then) =
      __$DetailedReasonCopyWithImpl<R, $Res>;
  $Res call({R reason});
}

/// @nodoc
class __$DetailedReasonCopyWithImpl<R extends FailureDetails, $Res>
    extends _$FailureCopyWithImpl<R, $Res>
    implements _$DetailedReasonCopyWith<R, $Res> {
  __$DetailedReasonCopyWithImpl(
      _DetailedReason<R> _value, $Res Function(_DetailedReason<R>) _then)
      : super(_value, (v) => _then(v as _DetailedReason<R>));

  @override
  _DetailedReason<R> get _value => super._value as _DetailedReason<R>;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_DetailedReason<R>(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$_DetailedReason<R extends FailureDetails>
    implements _DetailedReason<R> {
  const _$_DetailedReason(this.reason);

  @override
  final R reason;

  @override
  String toString() {
    return 'Failure<$R>.detailed(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailedReason<R> &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$DetailedReasonCopyWith<R, _DetailedReason<R>> get copyWith =>
      __$DetailedReasonCopyWithImpl<R, _DetailedReason<R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R reason) detailed,
    required TResult Function() emptyData,
    required TResult Function(Object error, StackTrace stackTrace)
        dataIntegrity,
    required TResult Function(Object error, StackTrace stackTrace) unknown,
  }) {
    return detailed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
  }) {
    return detailed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (detailed != null) {
      return detailed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailedReason<R> value) detailed,
    required TResult Function(_EmptyData<R> value) emptyData,
    required TResult Function(_DataIntegrityError<R> value) dataIntegrity,
    required TResult Function(_UnknownError<R> value) unknown,
  }) {
    return detailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
  }) {
    return detailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
    required TResult orElse(),
  }) {
    if (detailed != null) {
      return detailed(this);
    }
    return orElse();
  }
}

abstract class _DetailedReason<R extends FailureDetails> implements Failure<R> {
  const factory _DetailedReason(R reason) = _$_DetailedReason<R>;

  R get reason;
  @JsonKey(ignore: true)
  _$DetailedReasonCopyWith<R, _DetailedReason<R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EmptyDataCopyWith<R extends FailureDetails, $Res> {
  factory _$EmptyDataCopyWith(
          _EmptyData<R> value, $Res Function(_EmptyData<R>) then) =
      __$EmptyDataCopyWithImpl<R, $Res>;
}

/// @nodoc
class __$EmptyDataCopyWithImpl<R extends FailureDetails, $Res>
    extends _$FailureCopyWithImpl<R, $Res>
    implements _$EmptyDataCopyWith<R, $Res> {
  __$EmptyDataCopyWithImpl(
      _EmptyData<R> _value, $Res Function(_EmptyData<R>) _then)
      : super(_value, (v) => _then(v as _EmptyData<R>));

  @override
  _EmptyData<R> get _value => super._value as _EmptyData<R>;
}

/// @nodoc

class _$_EmptyData<R extends FailureDetails> implements _EmptyData<R> {
  const _$_EmptyData();

  @override
  String toString() {
    return 'Failure<$R>.emptyData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmptyData<R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R reason) detailed,
    required TResult Function() emptyData,
    required TResult Function(Object error, StackTrace stackTrace)
        dataIntegrity,
    required TResult Function(Object error, StackTrace stackTrace) unknown,
  }) {
    return emptyData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
  }) {
    return emptyData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (emptyData != null) {
      return emptyData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailedReason<R> value) detailed,
    required TResult Function(_EmptyData<R> value) emptyData,
    required TResult Function(_DataIntegrityError<R> value) dataIntegrity,
    required TResult Function(_UnknownError<R> value) unknown,
  }) {
    return emptyData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
  }) {
    return emptyData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
    required TResult orElse(),
  }) {
    if (emptyData != null) {
      return emptyData(this);
    }
    return orElse();
  }
}

abstract class _EmptyData<R extends FailureDetails> implements Failure<R> {
  const factory _EmptyData() = _$_EmptyData<R>;
}

/// @nodoc
abstract class _$DataIntegrityErrorCopyWith<R extends FailureDetails, $Res> {
  factory _$DataIntegrityErrorCopyWith(_DataIntegrityError<R> value,
          $Res Function(_DataIntegrityError<R>) then) =
      __$DataIntegrityErrorCopyWithImpl<R, $Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$DataIntegrityErrorCopyWithImpl<R extends FailureDetails, $Res>
    extends _$FailureCopyWithImpl<R, $Res>
    implements _$DataIntegrityErrorCopyWith<R, $Res> {
  __$DataIntegrityErrorCopyWithImpl(_DataIntegrityError<R> _value,
      $Res Function(_DataIntegrityError<R>) _then)
      : super(_value, (v) => _then(v as _DataIntegrityError<R>));

  @override
  _DataIntegrityError<R> get _value => super._value as _DataIntegrityError<R>;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_DataIntegrityError<R>(
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

class _$_DataIntegrityError<R extends FailureDetails>
    implements _DataIntegrityError<R> {
  const _$_DataIntegrityError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'Failure<$R>.dataIntegrity(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataIntegrityError<R> &&
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
  _$DataIntegrityErrorCopyWith<R, _DataIntegrityError<R>> get copyWith =>
      __$DataIntegrityErrorCopyWithImpl<R, _DataIntegrityError<R>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R reason) detailed,
    required TResult Function() emptyData,
    required TResult Function(Object error, StackTrace stackTrace)
        dataIntegrity,
    required TResult Function(Object error, StackTrace stackTrace) unknown,
  }) {
    return dataIntegrity(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
  }) {
    return dataIntegrity?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (dataIntegrity != null) {
      return dataIntegrity(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailedReason<R> value) detailed,
    required TResult Function(_EmptyData<R> value) emptyData,
    required TResult Function(_DataIntegrityError<R> value) dataIntegrity,
    required TResult Function(_UnknownError<R> value) unknown,
  }) {
    return dataIntegrity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
  }) {
    return dataIntegrity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
    required TResult orElse(),
  }) {
    if (dataIntegrity != null) {
      return dataIntegrity(this);
    }
    return orElse();
  }
}

abstract class _DataIntegrityError<R extends FailureDetails>
    implements Failure<R> {
  const factory _DataIntegrityError(Object error, StackTrace stackTrace) =
      _$_DataIntegrityError<R>;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$DataIntegrityErrorCopyWith<R, _DataIntegrityError<R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownErrorCopyWith<R extends FailureDetails, $Res> {
  factory _$UnknownErrorCopyWith(
          _UnknownError<R> value, $Res Function(_UnknownError<R>) then) =
      __$UnknownErrorCopyWithImpl<R, $Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$UnknownErrorCopyWithImpl<R extends FailureDetails, $Res>
    extends _$FailureCopyWithImpl<R, $Res>
    implements _$UnknownErrorCopyWith<R, $Res> {
  __$UnknownErrorCopyWithImpl(
      _UnknownError<R> _value, $Res Function(_UnknownError<R>) _then)
      : super(_value, (v) => _then(v as _UnknownError<R>));

  @override
  _UnknownError<R> get _value => super._value as _UnknownError<R>;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_UnknownError<R>(
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

class _$_UnknownError<R extends FailureDetails> implements _UnknownError<R> {
  const _$_UnknownError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'Failure<$R>.unknown(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnknownError<R> &&
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
  _$UnknownErrorCopyWith<R, _UnknownError<R>> get copyWith =>
      __$UnknownErrorCopyWithImpl<R, _UnknownError<R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(R reason) detailed,
    required TResult Function() emptyData,
    required TResult Function(Object error, StackTrace stackTrace)
        dataIntegrity,
    required TResult Function(Object error, StackTrace stackTrace) unknown,
  }) {
    return unknown(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
  }) {
    return unknown?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(R reason)? detailed,
    TResult Function()? emptyData,
    TResult Function(Object error, StackTrace stackTrace)? dataIntegrity,
    TResult Function(Object error, StackTrace stackTrace)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DetailedReason<R> value) detailed,
    required TResult Function(_EmptyData<R> value) emptyData,
    required TResult Function(_DataIntegrityError<R> value) dataIntegrity,
    required TResult Function(_UnknownError<R> value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DetailedReason<R> value)? detailed,
    TResult Function(_EmptyData<R> value)? emptyData,
    TResult Function(_DataIntegrityError<R> value)? dataIntegrity,
    TResult Function(_UnknownError<R> value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownError<R extends FailureDetails> implements Failure<R> {
  const factory _UnknownError(Object error, StackTrace stackTrace) =
      _$_UnknownError<R>;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$UnknownErrorCopyWith<R, _UnknownError<R>> get copyWith =>
      throw _privateConstructorUsedError;
}
