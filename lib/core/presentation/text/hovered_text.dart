import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../animations/color_animation.dart';
import '../animations/scale_animation.dart';
import '../common/hover_listener.dart';

class HoveredText extends StatelessWidget {
  final String text;
  final Color beginColor;
  final Color colorOnHover;
  final TextStyle? style;
  final TextAlign? textAlign;
  const HoveredText({
    super.key,
    required this.text,
    this.beginColor = AppTheme.white,
    this.colorOnHover = AppTheme.purple,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        text.length,
        (index) => Letter(
          letter: text[index],
          beginColor: beginColor,
          colorOnHover: colorOnHover,
          textAlign: textAlign,
          style: style,
        ),
      ),
    );
  }
}

class Letter extends StatefulWidget {
  final String letter;
  final Color beginColor;
  final Color colorOnHover;
  final TextStyle? style;
  final TextAlign? textAlign;
  const Letter({
    super.key,
    required this.letter,
    required this.beginColor,
    required this.colorOnHover,
    this.style,
    this.textAlign,
  });

  @override
  State<Letter> createState() => _LetterState();
}

class _LetterState extends State<Letter> {
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
      builder: (isHovered) => ColorAnimation(
        isActive: isHovered,
        beginColor: widget.beginColor,
        colorOnHover: widget.colorOnHover,
        child: ScaleAnimation(
          isActive: isHovered,
          child: Text(
            widget.letter,
            overflow: TextOverflow.ellipsis,
            textAlign: widget.textAlign,
            style: widget.style,
          ),
        ),
      ),
    );
  }
}
