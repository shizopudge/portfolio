import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/usecases/send_email.dart';

part 'contacts_cubit.freezed.dart';
part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({required SendEmail sendEmail})
      : _sendEmailUsecase = sendEmail,
        super(const ContactsState());

  final SendEmail _sendEmailUsecase;

  Future<void> sendEmail() async {
    if (state.isValidated) {
      emit(state.copyWith(status: ContactsStatus.loading));
      await _sendEmailUsecase
          .call(SendEmailParams(
              email: state.email,
              subject: state.subject,
              message: state.message))
          .then(
            (res) => res.fold(
              (failure) => _emitFailure(failure),
              (r) {
                emit(state.copyWith(status: ContactsStatus.success));
                emit(state.copyWith(status: ContactsStatus.input));
              },
            ),
          );
    }
  }

  void setEmail(String email) => emit(state.copyWith(email: email));

  void setSubject(String subject) => emit(state.copyWith(subject: subject));

  void setMessage(String message) => emit(state.copyWith(message: message));

  void _emitFailure(Failure failure) {
    emit(state.copyWith(status: ContactsStatus.failure, failure: failure));
    emit(
        state.copyWith(status: ContactsStatus.input, failure: const Failure()));
  }
}
