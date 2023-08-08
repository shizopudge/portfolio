import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/contacts_repository.dart';
import '../datasources/contacts_remote_data_source.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsRemoteDataSource remoteDataSource;

  const ContactsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  FutureEither<void> sendEmail({
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      await remoteDataSource.sendEmail(
          email: email, subject: subject, message: message);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
