import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'core/utils/di.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await initializeApp();
  Animate.restartOnHotReload = true;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const App(),
    ),
  );
}

void main() => bootstrap();
