import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/assets.dart';
import '../../../core/presentation/buttons/colored_scaled_on_hover_button.dart';
import '../../../core/utils/helper_widgets.dart';
import '../../../core/utils/responsive.dart';
import 'my_card.dart';

class RootDesktop extends StatelessWidget {
  final VoidCallback githubCallback;
  final VoidCallback telegramCallback;
  final VoidCallback messageCallback;
  const RootDesktop({
    super.key,
    required this.githubCallback,
    required this.telegramCallback,
    required this.messageCallback,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ColoredScaledOnHoverButton(
                            onTap: githubCallback,
                            child: SvgPicture.asset(
                              Assets.githubIcon,
                              height: 50,
                            ),
                          ),
                          addHorizontalPadding(15),
                          ColoredScaledOnHoverButton(
                            onTap: telegramCallback,
                            child: SvgPicture.asset(
                              Assets.telegramIcon,
                              height: 55,
                            ),
                          ),
                        ],
                      ),
                      ColoredScaledOnHoverButton(
                        onTap: messageCallback,
                        child: SvgPicture.asset(
                          Assets.emailIcon,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  addVerticalPadding(15),
                  Expanded(
                    child: Center(
                      child: MyCard(
                        height: SizeConfig.screenHeight! * .85,
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 400,
                          minWidth: 400,
                          maxHeight: 650,
                          minHeight: 500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
