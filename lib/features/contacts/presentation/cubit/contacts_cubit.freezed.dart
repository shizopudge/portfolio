// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactsState {
  String get email => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ContactsStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactsStateCopyWith<ContactsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsStateCopyWith<$Res> {
  factory $ContactsStateCopyWith(
          ContactsState value, $Res Function(ContactsState) then) =
      _$ContactsStateCopyWithImpl<$Res, ContactsState>;
  @useResult
  $Res call(
      {String email,
      String subject,
      String message,
      ContactsStatus status,
      Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$ContactsStateCopyWithImpl<$Res, $Val extends ContactsState>
    implements $ContactsStateCopyWith<$Res> {
  _$ContactsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? subject = null,
    Object? message = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContactsStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContactsStateCopyWith<$Res>
    implements $ContactsStateCopyWith<$Res> {
  factory _$$_ContactsStateCopyWith(
          _$_ContactsState value, $Res Function(_$_ContactsState) then) =
      __$$_ContactsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String subject,
      String message,
      ContactsStatus status,
      Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ContactsStateCopyWithImpl<$Res>
    extends _$ContactsStateCopyWithImpl<$Res, _$_ContactsState>
    implements _$$_ContactsStateCopyWith<$Res> {
  __$$_ContactsStateCopyWithImpl(
      _$_ContactsState _value, $Res Function(_$_ContactsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? subject = null,
    Object? message = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_$_ContactsState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContactsStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_ContactsState extends _ContactsState with DiagnosticableTreeMixin {
  const _$_ContactsState(
      {this.email = '',
      this.subject = '',
      this.message = '',
      this.status = ContactsStatus.input,
      this.failure = const Failure()})
      : super._();

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final ContactsStatus status;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContactsState(email: $email, subject: $subject, message: $message, status: $status, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContactsState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactsState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, subject, message, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactsStateCopyWith<_$_ContactsState> get copyWith =>
      __$$_ContactsStateCopyWithImpl<_$_ContactsState>(this, _$identity);
}

abstract class _ContactsState extends ContactsState {
  const factory _ContactsState(
      {final String email,
      final String subject,
      final String message,
      final ContactsStatus status,
      final Failure failure}) = _$_ContactsState;
  const _ContactsState._() : super._();

  @override
  String get email;
  @override
  String get subject;
  @override
  String get message;
  @override
  ContactsStatus get status;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_ContactsStateCopyWith<_$_ContactsState> get copyWith =>
      throw _privateConstructorUsedError;
}
