import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
import '../../../core/presentation/common/animated_background.dart';
import '../../../core/utils/popup.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/theme.dart';
import '../../contacts/presentation/pages/contacts_page.dart';
import '../cubit/root_cubit.dart';
import '../widgets/root_desktop.dart';
import '../widgets/root_mobile.dart';
import '../widgets/root_tablet.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  void _githubCallback(BuildContext context) =>
      context.read<RootCubit>().launchUrl(AppConstants.githubLink);

  void _telegramCallback(BuildContext context) =>
      context.read<RootCubit>().launchUrl(AppConstants.telegramLink);

  void _messageCallback(BuildContext context) =>
      Navigator.of(context).pushNamed(ContactsPage.path);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RootCubit, RootState>(
      listener: (context, state) => state.whenOrNull(
        failure: (failure) => Popup.showSnackbar(
          context: context,
          text: failure.message,
          backgroundColor: AppTheme.red,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Responsive(
            desktop: AnimatedBackground(
              child: RootDesktop(
                githubCallback: () => _githubCallback(context),
                telegramCallback: () => _telegramCallback(context),
                messageCallback: () => _messageCallback(context),
              ),
            ),
            tablet: RootTablet(
              githubCallback: () => _githubCallback(context),
              telegramCallback: () => _telegramCallback(context),
              messageCallback: () => _messageCallback(context),
            ),
            mobile: RootMobile(
              githubCallback: () => _githubCallback(context),
              telegramCallback: () => _telegramCallback(context),
              messageCallback: () => _messageCallback(context),
            ),
          ),
        ),
      ),
    );
  }
}
