import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/buttons/colored_scaled_on_hover_button.dart';
import '../../../../core/presentation/buttons/gradient_button.dart';
import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/presentation/text/hovered_text.dart';
import '../../../../core/utils/helper_widgets.dart';
import '../../../../core/utils/theme.dart';

import '../../../../core/utils/responsive.dart';
import '../cubit/contacts_cubit.dart';

class ContactsDesktop extends StatelessWidget {
  final VoidCallback sendEmailCallback;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  const ContactsDesktop({
    super.key,
    required this.emailController,
    required this.subjectController,
    required this.messageController,
    required this.sendEmailCallback,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    final state = context.watch<ContactsCubit>().state;
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
                      HoveredText(
                        text: 'Контактная Форма',
                        beginColor: AppTheme.white,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      ColoredScaledOnHoverButton(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addVerticalPadding(10),
                        Flexible(
                          flex: 0,
                          child: CommonTextField(
                            controller: emailController,
                            hintText: 'EMAIL',
                            width: SizeConfig.screenWidth! * .5,
                            fontSize: 32,
                            constraints: const BoxConstraints(
                              maxWidth: 600,
                              maxHeight: 350,
                              minHeight: 20,
                              minWidth: 200,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp('[ ]'),
                              ),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9a-zA-Z\.@]')),
                            ],
                          ),
                        ),
                        addVerticalPadding(40),
                        Flexible(
                          flex: 0,
                          child: CommonTextField(
                            controller: subjectController,
                            hintText: 'ТЕМА',
                            width: SizeConfig.screenWidth! * .5,
                            fontSize: 32,
                            constraints: const BoxConstraints(
                              maxWidth: 600,
                              maxHeight: 350,
                              minHeight: 20,
                              minWidth: 200,
                            ),
                          ),
                        ),
                        addVerticalPadding(40),
                        Flexible(
                          flex: 2,
                          child: CommonTextField(
                            controller: messageController,
                            hintText: 'СООБЩЕНИЕ',
                            width: SizeConfig.screenWidth! * .5,
                            fontSize: 32,
                            constraints: const BoxConstraints(
                              maxWidth: 600,
                              maxHeight: 350,
                              minHeight: 20,
                              minWidth: 200,
                            ),
                            maxLines: 12,
                          ),
                        ),
                        addVerticalPadding(40),
                        Flexible(
                          flex: 0,
                          child: GradientButton(
                            onTap: sendEmailCallback,
                            isEnabled: state.isValidated,
                            height: double.infinity,
                            width: SizeConfig.screenWidth! * .35,
                            padding: const EdgeInsets.all(15),
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                              maxHeight: 70,
                              minHeight: 35,
                              minWidth: 200,
                            ),
                            child: state.isLoading
                                ? const FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: CircularProgressIndicator(
                                      color: AppTheme.white,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                : FittedBox(
                                    child: state.isValidated
                                        ? HoveredText(
                                            text: 'Отправить',
                                            textAlign: TextAlign.center,
                                            beginColor:
                                                AppTheme.white.withOpacity(.8),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge)
                                        : Text(
                                            'Отправить',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: AppTheme.white
                                                      .withOpacity(.35),
                                                ),
                                          ),
                                  ),
                          ),
                        ),
                      ],
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
