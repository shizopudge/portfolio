import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../constants/type_defs.dart';
import '../failure/failure.dart';
import 'theme.dart';

class Popup {
  FutureEither<void> launchUrl(String url) async {
    try {
      final res = await url_launcher.launchUrl(Uri.parse(url));
      if (!res) throw Exception('Не удалось открыть $url');
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  static void showSnackbar({
    required BuildContext context,
    required String text,
    TextStyle? style,
    Color backgroundColor = AppTheme.white,
    Duration duration = const Duration(milliseconds: 3500),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: style ?? Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}
