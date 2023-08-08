import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/utils/dio.dart';

abstract interface class ContactsRemoteDataSource {
  Future<void> sendEmail({
    required String email,
    required String subject,
    required String message,
  });
}

class ContactsRemoteDataSourceImpl implements ContactsRemoteDataSource {
  final DioClient _dioClient;

  const ContactsRemoteDataSourceImpl(this._dioClient);

  static const serviceId = 'service_z90lr0w';
  static const templateId = 'template_0nfeclt';
  static const userId = 'POtrr7a3uJh3TL8GU';

  @override
  Future<void> sendEmail({
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 2500));
      await _dioClient.post(
        'https://api.emailjs.com/api/v1.0/email/send',
        options: Options(
          headers: !kIsWeb
              ? {
                  'origin': 'http://localhost',
                }
              : null,
        ),
        data: {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          },
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
