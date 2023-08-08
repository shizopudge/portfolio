import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_client/core/presentation/common/animated_background.dart';

import '../../../../core/utils/popup.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/theme.dart';
import '../cubit/contacts_cubit.dart';
import '../widgets/contacts_desktop.dart';
import '../widgets/contacts_mobile.dart';
import '../widgets/contacts_tablet.dart';

class ContactsPage extends StatefulWidget {
  static const String path = '/contacts';
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late final TextEditingController _emailController = TextEditingController()
    ..addListener(_emailListener);
  late final TextEditingController _subjectController = TextEditingController()
    ..addListener(_subjectListener);
  late final TextEditingController _messageController = TextEditingController()
    ..addListener(_messageListener);

  void _emailListener() =>
      context.read<ContactsCubit>().setEmail(_emailController.text.trim());

  void _subjectListener() =>
      context.read<ContactsCubit>().setSubject(_subjectController.text.trim());

  void _messageListener() =>
      context.read<ContactsCubit>().setMessage(_messageController.text.trim());

  void _sendEmailCallback() => context.read<ContactsCubit>().sendEmail();

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.initialize(context);
    return BlocListener<ContactsCubit, ContactsState>(
      listener: (context, state) => state.when(
        whenFailure: () => Popup.showSnackbar(
          context: context,
          text: state.failure.message,
          backgroundColor: AppTheme.red,
        ),
        whenSuccess: () => Popup.showSnackbar(
          context: context,
          text: 'Ваше сообщение успешно отправлено!',
          backgroundColor: AppTheme.green,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: AnimatedBackground(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.black.withOpacity(
                      .1,
                    ),
                  ),
                ],
              ),
              child: Responsive(
                desktop: ContactsDesktop(
                  sendEmailCallback: _sendEmailCallback,
                  emailController: _emailController,
                  subjectController: _subjectController,
                  messageController: _messageController,
                ),
                tablet: ContactsTablet(
                  sendEmailCallback: _sendEmailCallback,
                  emailController: _emailController,
                  subjectController: _subjectController,
                  messageController: _messageController,
                ),
                mobile: ContactsMobile(
                  sendEmailCallback: _sendEmailCallback,
                  emailController: _emailController,
                  subjectController: _subjectController,
                  messageController: _messageController,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
