import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/assets.dart';
import '../../../core/presentation/common/hover_listener.dart';
import '../../../core/presentation/text/hovered_text.dart';
import '../../../core/utils/helper_widgets.dart';
import '../../../core/utils/theme.dart';

class MyCard extends StatefulWidget {
  final double height;
  final double width;
  final BoxConstraints? constraints;
  final BoxShadow? beginShadow;
  final BoxShadow? endShadow;
  const MyCard({
    super.key,
    required this.height,
    required this.width,
    this.constraints,
    this.beginShadow,
    this.endShadow,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this);

  final HoverNotifier _hoverNotifier = HoverNotifier();

  final ValueNotifier<Offset> _locationNotifier = ValueNotifier(Offset.zero);

  final ValueNotifier<Tween<Alignment>> _gradientAlignmentNotifier =
      ValueNotifier(
    Tween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  void _updateGradient(Offset location) {
    if (location.dx < 0) {
      _gradientAlignmentNotifier.value.begin = Alignment.topRight;
      _gradientAlignmentNotifier.value.end = Alignment.bottomLeft;
    } else {
      _gradientAlignmentNotifier.value.begin = Alignment.bottomRight;
      _gradientAlignmentNotifier.value.end = Alignment.topLeft;
    }
    if (location.dy < 0) {
      _gradientAlignmentNotifier.value.begin = Alignment.topLeft;
      _gradientAlignmentNotifier.value.end = Alignment.bottomRight;
    } else {
      _gradientAlignmentNotifier.value.begin = Alignment.bottomLeft;
      _gradientAlignmentNotifier.value.end = Alignment.topRight;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _hoverNotifier.dispose();
    _locationNotifier.dispose();
    _gradientAlignmentNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverListener(
      hoverNotifier: _hoverNotifier,
      onEnter: (event) => _animationController.stop(),
      onExit: (event) => _animationController.repeat(reverse: true),
      builder: (isHovered) => ValueListenableBuilder(
        valueListenable: _locationNotifier,
        builder: (context, location, child) => ValueListenableBuilder(
          valueListenable: _gradientAlignmentNotifier,
          builder: (context, gradientAlignment, child) => GestureDetector(
            onPanUpdate: (details) {
              _animationController.reset();
              _locationNotifier.value += details.delta;
              _hoverNotifier.value = true;
              _updateGradient(location);
            },
            onPanEnd: (details) {
              _animationController.forward();
              _hoverNotifier.value = false;
              _locationNotifier.value = Offset.zero;
              _gradientAlignmentNotifier.value.begin = Alignment.topLeft;
              _gradientAlignmentNotifier.value.end = Alignment.bottomRight;
            },
            child: MyCardAnimation(
              animationController: _animationController,
              isActive: isHovered || location != Offset.zero,
              beginShadow: widget.beginShadow,
              endShadow: widget.endShadow,
              myCard: Container(
                height: widget.height,
                width: widget.width,
                constraints: widget.constraints,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(0.002 * location.dy)
                  ..rotateY(-0.002 * location.dx),
                transformAlignment: FractionalOffset.center,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(Assets.me),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(
                    21,
                  ),
                  border: Border.all(
                    color: AppTheme.black.withOpacity(
                      .75,
                    ),
                    width: 2,
                  ),
                ),
                child: AnimatedContainer(
                  duration: 1000.ms,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(
                      21,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.black.withOpacity(
                          .2,
                        ),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: gradientAlignment.begin ?? Alignment.topLeft,
                      end: gradientAlignment.end ?? Alignment.bottomRight,
                      colors: [
                        AppTheme.red.withOpacity(.5),
                        AppTheme.pink.withOpacity(.5),
                        AppTheme.yellow.withOpacity(.4),
                        AppTheme.green.withOpacity(.4),
                        AppTheme.blue.withOpacity(.4),
                      ],
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double height = constraints.maxHeight;
                      final double width = constraints.maxWidth;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyCardAttribute(
                                  label: 'СИЛА',
                                  value: '9999',
                                  height: height * .055,
                                  width: width * .5,
                                ),
                                MyCardAttribute(
                                  label: 'ЛОВКОСТЬ',
                                  value: '9999',
                                  height: height * .055,
                                  width: width * .5,
                                ),
                                MyCardAttribute(
                                  label: 'МАСТЕРСТВО',
                                  value: '9999',
                                  height: height * .055,
                                  width: width * .5,
                                ),
                                MyCardAttribute(
                                  label: 'СМЕКАЛКА',
                                  value: '9999',
                                  height: height * .055,
                                  width: width * .5,
                                ),
                              ],
                            ),
                          ),
                          addVerticalPadding(8),
                          Flexible(
                            flex: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  21,
                                ),
                                border: Border.all(color: AppTheme.black),
                                color: AppTheme.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.black.withOpacity(.7),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: FittedBox(
                                child: HoveredText(
                                  text: 'Вам снился этот человек?',
                                  textAlign: TextAlign.center,
                                  beginColor: AppTheme.black.withOpacity(.7),
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                            ),
                          ),
                          addVerticalPadding(8),
                          Flexible(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.hero,
                                      ),
                                      FittedBox(
                                        child: HoveredText(
                                          text: 'ГЕРОЙ',
                                          beginColor: AppTheme.white,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                addHorizontalPadding(8),
                                Flexible(
                                  flex: 5,
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          child: HoveredText(
                                            text: 'РУСТАМ',
                                            beginColor: AppTheme.white,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge,
                                          ),
                                        ),
                                        FittedBox(
                                          child: HoveredText(
                                            text: 'FLUTTER РАЗРАБОТЧИК',
                                            beginColor: AppTheme.white,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                addHorizontalPadding(8),
                                Flexible(
                                  flex: 0,
                                  child: FittedBox(
                                    child: HoveredText(
                                      text: '11',
                                      beginColor: AppTheme.white,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCardAttribute extends StatelessWidget {
  final String label;
  final String value;
  final double height;
  final double width;
  const MyCardAttribute({
    super.key,
    required this.label,
    required this.value,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                21,
              ),
              border: Border.all(color: AppTheme.black),
              color: AppTheme.darkGreen,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(.7),
                  blurRadius: 3,
                ),
              ],
            ),
            child: FittedBox(
              alignment: Alignment.centerRight,
              child: HoveredText(
                text: label,
                beginColor: AppTheme.white,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  shadows: [
                    Shadow(
                      color: AppTheme.black.withOpacity(.5),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          addHorizontalPadding(width * .05),
          Container(
            clipBehavior: Clip.none,
            height: height,
            width: width / 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.black),
              color: AppTheme.darkRed,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(.7),
                  blurRadius: 3,
                ),
              ],
            ),
            child: FittedBox(
              child: HoveredText(
                text: value,
                beginColor: AppTheme.white,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  shadows: [
                    const Shadow(
                      color: AppTheme.black,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCardAnimation extends StatelessWidget {
  final AnimationController animationController;
  final bool isActive;
  final Widget myCard;
  final BoxShadow? beginShadow;
  final BoxShadow? endShadow;
  const MyCardAnimation({
    super.key,
    required this.animationController,
    required this.isActive,
    required this.myCard,
    this.beginShadow,
    this.endShadow,
  });

  @override
  Widget build(BuildContext context) {
    return myCard
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
          controller: animationController,
        )
        .shimmer(
          duration: 1000.ms,
        )
        .flipV(duration: 5000.ms, begin: 0.02, end: -0.02)
        .animate(target: isActive ? 1 : 0)
        .scaleXY(end: 1.1, duration: 200.ms)
        .boxShadow(
          begin: BoxShadow(
            color: AppTheme.white.withOpacity(.2),
            blurRadius: 360,
          ),
          end: BoxShadow(
            color: AppTheme.blue.withOpacity(.55),
            blurRadius: 360,
            spreadRadius: 100,
          ),
          borderRadius: BorderRadius.circular(21),
        )
        .animate()
        .fade(duration: 400.ms, begin: 0, end: 1)
        .slideY(begin: 3, end: 0, duration: 500.ms)
        .scaleXY(duration: 600.ms, begin: 0, end: 1);
  }
}
