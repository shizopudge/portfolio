import '../../../../core/constants/type_defs.dart';

abstract interface class ContactsRepository {
  FutureEither<void> sendEmail({
    required String email,
    required String subject,
    required String message,
  });
}
