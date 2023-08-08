import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  static final List<Color> _colors1 = [
    AppTheme.red.withOpacity(.55),
    AppTheme.purple.withOpacity(.55),
    AppTheme.green.withOpacity(.55),
    AppTheme.yellow.withOpacity(.55),
    AppTheme.pink.withOpacity(.55),
  ];
  static final List<Color> _colors2 = [
    AppTheme.pink.withOpacity(.55),
    AppTheme.yellow.withOpacity(.55),
    AppTheme.green.withOpacity(.55),
    AppTheme.purple.withOpacity(.55),
    AppTheme.red.withOpacity(.55),
  ];

  late Timer? _timer;

  late final AnimationController _animationController;
  late final Animation<double> _angleAnimation;
  late final ValueNotifier<List<Color>> _colorsNotifier =
      ValueNotifier(_colors1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 30000,
      ),
    );

    _angleAnimation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(_animationController);

    _timer = Timer.periodic(
      const Duration(milliseconds: 1500),
      (timer) {
        if (_colorsNotifier.value == _colors1) {
          _colorsNotifier.value = _colors2;
        } else {
          _colorsNotifier.value = _colors1;
        }
      },
    );

    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _colorsNotifier.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => ValueListenableBuilder(
        valueListenable: _colorsNotifier,
        builder: (context, colors, _) => AnimatedContainer(
          duration: const Duration(milliseconds: 30000),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            gradient: SweepGradient(
              colors: colors,
              startAngle: _angleAnimation.value,
              endAngle: _angleAnimation.value + (2 * math.pi),
              tileMode: TileMode.repeated,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 300,
              sigmaY: 300,
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.black.withOpacity(
                      .8,
                    ),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
