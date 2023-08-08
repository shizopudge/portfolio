import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/theme.dart';

class ColorAnimation extends StatelessWidget {
  final Widget child;
  final Color beginColor;
  final Color colorOnHover;
  final bool isActive;
  const ColorAnimation({
    super.key,
    required this.child,
    this.beginColor = AppTheme.white,
    this.colorOnHover = AppTheme.purple,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return child.animate(target: isActive ? 1 : 0).color(
          begin: beginColor,
          end: colorOnHover,
          blendMode: BlendMode.srcIn,
        );
  }
}
