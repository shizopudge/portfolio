import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static void initialize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static bool get isMobile => screenWidth! < 550;

  static bool get isTablet => screenWidth! >= 550 && screenWidth! <= 900;

  static bool get isDesktop => screenWidth! > 900;
}

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  const Responsive({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    if (SizeConfig.isDesktop) return desktop;
    if (SizeConfig.isTablet) return tablet;
    return mobile;
  }
}
