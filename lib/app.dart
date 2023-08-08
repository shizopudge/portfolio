import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/utils/di.dart';
import 'core/utils/responsive.dart';
import 'core/utils/router.dart';
import 'core/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.theme,
      onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
    );
  }
}
