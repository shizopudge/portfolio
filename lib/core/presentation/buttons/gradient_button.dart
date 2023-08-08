import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../animations/scale_animation.dart';
import '../common/hover_listener.dart';

class GradientButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final Widget child;
  final BoxConstraints constraints;
  final double width;
  final double height;
  final EdgeInsets padding;
  const GradientButton({
    super.key,
    required this.onTap,
    required this.isEnabled,
    required this.child,
    required this.constraints,
    required this.width,
    required this.height,
    required this.padding,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  final HoverNotifier _hoverNotifier = HoverNotifier();

  @override
  void dispose() {
    _hoverNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEnabled) {
      return HoverListener(
        hoverNotifier: _hoverNotifier,
        builder: (isHovered) => ScaleAnimation(
          isActive: isHovered,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: widget.padding,
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  21,
                ),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.purple.withOpacity(.75),
                    AppTheme.pink.withOpacity(.75),
                    AppTheme.darkRed.withOpacity(.75),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.purple.withOpacity(
                      .35,
                    ),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, -3),
                  ),
                  BoxShadow(
                    color: AppTheme.pink.withOpacity(
                      .35,
                    ),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: AppTheme.darkRed.withOpacity(
                      .35,
                    ),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              constraints: widget.constraints,
              child: widget.child,
            ),
          ),
        ),
      );
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: widget.padding,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          21,
        ),
        gradient: LinearGradient(
          colors: [
            AppTheme.purple.withOpacity(.35),
            AppTheme.pink.withOpacity(.35),
            AppTheme.darkRed.withOpacity(.35),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withOpacity(
              .15,
            ),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, -3),
          ),
          BoxShadow(
            color: AppTheme.pink.withOpacity(
              .15,
            ),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: AppTheme.darkRed.withOpacity(
              .15,
            ),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      constraints: widget.constraints,
      child: widget.child,
    );
  }
}
