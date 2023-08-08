import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../animations/color_animation.dart';
import '../animations/scale_animation.dart';
import '../common/hover_listener.dart';

class ColoredScaledOnHoverButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color beginColor;
  final Color colorOnHover;
  final double scaleBegin;
  final double scaleEnd;
  const ColoredScaledOnHoverButton({
    super.key,
    required this.onTap,
    required this.child,
    this.beginColor = AppTheme.white,
    this.colorOnHover = AppTheme.purple,
    this.scaleBegin = 1.0,
    this.scaleEnd = 1.1,
  });

  @override
  State<ColoredScaledOnHoverButton> createState() =>
      _ColoredScaledOnHoverButtonState();
}

class _ColoredScaledOnHoverButtonState
    extends State<ColoredScaledOnHoverButton> {
  final HoverNotifier _hoverNotifier = HoverNotifier();
  @override
  void dispose() {
    _hoverNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverListener(
      hoverNotifier: _hoverNotifier,
      builder: (isHovered) => GestureDetector(
        onTap: widget.onTap,
        child: ColorAnimation(
          beginColor: widget.beginColor,
          colorOnHover: widget.colorOnHover,
          isActive: isHovered,
          child: ScaleAnimation(
            isActive: isHovered,
            begin: widget.scaleBegin,
            end: widget.scaleEnd,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
