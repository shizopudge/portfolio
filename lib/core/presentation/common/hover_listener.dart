import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverNotifier with ChangeNotifier {
  bool _isHovered = false;

  set value(bool isHovered) {
    _isHovered = isHovered;
    notifyListeners();
  }

  bool get isHovered => _isHovered;

  @override
  void dispose() {
    value = false;
    super.dispose();
  }
}

class HoverListener extends StatelessWidget {
  final HoverNotifier _hoverNotifier;
  final Widget Function(bool isHovered) builder;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final MouseCursor cursor;
  const HoverListener({
    super.key,
    required HoverNotifier hoverNotifier,
    required this.builder,
    this.onEnter,
    this.onExit,
    this.cursor = SystemMouseCursors.click,
  }) : _hoverNotifier = hoverNotifier;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onEnter: (event) {
        _hoverNotifier.value = true;
        if (onEnter != null) onEnter!(event);
      },
      onExit: (event) {
        _hoverNotifier.value = false;
        if (onExit != null) onExit!(event);
      },
      child: ListenableBuilder(
        listenable: _hoverNotifier,
        builder: (context, _) => builder(_hoverNotifier.isHovered),
      ),
    );
  }
}
