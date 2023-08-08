import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final double begin;
  final double end;
  final bool isActive;
  const ScaleAnimation({
    super.key,
    required this.child,
    required this.isActive,
    this.begin = 1.0,
    this.end = 1.1,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate(target: isActive ? 1 : 0)
        .scaleXY(begin: begin, end: end);
  }
}
