import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecase/usecase.dart';
import '../repositories/contacts_repository.dart';

class SendEmail implements UseCase<void, SendEmailParams> {
  final ContactsRepository repository;

  const SendEmail(this.repository);
  @override
  FutureEither<void> call(params) async => repository.sendEmail(
      email: params.email, subject: params.subject, message: params.message);
}

class SendEmailParams extends Equatable {
  final String email;
  final String subject;
  final String message;

  const SendEmailParams({
    required this.email,
    required this.subject,
    required this.message,
  });

  @override
  List<Object?> get props => [email, subject, message];
}
