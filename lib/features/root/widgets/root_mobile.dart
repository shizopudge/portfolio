import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/assets.dart';
import '../../../core/presentation/buttons/colored_scaled_on_hover_button.dart';
import '../../../core/utils/helper_widgets.dart';
import '../../../core/utils/responsive.dart';
import 'my_card.dart';

class RootMobile extends StatelessWidget {
  final VoidCallback githubCallback;
  final VoidCallback telegramCallback;
  final VoidCallback messageCallback;
  const RootMobile({
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
                              height: SizeConfig.screenWidth! * .12,
                            ),
                          ),
                          addHorizontalPadding(SizeConfig.screenWidth! * .05),
                          ColoredScaledOnHoverButton(
                            onTap: telegramCallback,
                            child: SvgPicture.asset(
                              Assets.telegramIcon,
                              height: SizeConfig.screenWidth! * .12,
                            ),
                          ),
                        ],
                      ),
                      ColoredScaledOnHoverButton(
                        onTap: messageCallback,
                        child: SvgPicture.asset(
                          Assets.emailIcon,
                          height: SizeConfig.screenWidth! * .12,
                        ),
                      ),
                    ],
                  ),
                  addVerticalPadding(15),
                  Expanded(
                    child: Center(
                      child: MyCard(
                        height: SizeConfig.screenHeight! * .8,
                        width: SizeConfig.screenWidth! * .75,
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                          minWidth: 150,
                          maxHeight: 500,
                          minHeight: 300,
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
