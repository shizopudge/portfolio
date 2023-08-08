part of 'contacts_cubit.dart';

enum ContactsStatus {
  input,
  loading,
  success,
  failure;

  bool get isInput => this == ContactsStatus.input;
  bool get isLoading => this == ContactsStatus.loading;
  bool get isSuccess => this == ContactsStatus.success;
  bool get isFailure => this == ContactsStatus.failure;
}

@freezed
class ContactsState with _$ContactsState {
  const ContactsState._();
  const factory ContactsState({
    @Default('') String email,
    @Default('') String subject,
    @Default('') String message,
    @Default(ContactsStatus.input) ContactsStatus status,
    @Default(Failure()) Failure failure,
  }) = _ContactsState;

  void when({
    VoidCallback? whenInput,
    VoidCallback? whenLoading,
    VoidCallback? whenSuccess,
    VoidCallback? whenFailure,
  }) =>
      switch (status) {
        ContactsStatus.input => whenInput?.call(),
        ContactsStatus.loading => whenLoading?.call(),
        ContactsStatus.success => whenSuccess?.call(),
        ContactsStatus.failure => whenFailure?.call(),
      };

  bool _validate() {
    if (EmailValidator.validate(email) &&
        subject.isNotEmpty &&
        message.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool get isValidated => _validate();

  bool get isInput => status.isInput;
  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}
