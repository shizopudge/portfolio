import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CommonAppearAnimation extends StatelessWidget {
  final double fadeBegin;
  final double slideBegin;
  final double scaleBegin;
  final double delay;
  final Widget child;
  const CommonAppearAnimation({
    super.key,
    this.fadeBegin = 0,
    this.slideBegin = -3,
    this.scaleBegin = 0,
    required this.child,
    this.delay = 1,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fade(duration: 300.ms * delay, begin: fadeBegin, end: 1)
        .slideY(begin: slideBegin, end: 0, duration: 400.ms * delay)
        .scaleXY(duration: 500.ms * delay, begin: scaleBegin, end: 1);
  }
}
