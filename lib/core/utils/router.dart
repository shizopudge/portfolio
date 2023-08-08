import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/contacts/data/repositories/contacts_repository_impl.dart';
import '../../features/contacts/domain/usecases/send_email.dart';
import '../../features/contacts/presentation/cubit/contacts_cubit.dart';
import '../../features/contacts/presentation/pages/contacts_page.dart';
import '../../features/root/cubit/root_cubit.dart';
import '../../features/root/pages/root_page.dart';
import 'di.dart';
import 'popup.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RootCubit(
              popup: getIt<Popup>(),
            ),
            child: const RootPage(),
          ),
        );
      case ContactsPage.path:
        return PageTransition(
          child: BlocProvider(
            create: (_) => ContactsCubit(
              sendEmail: SendEmail(
                getIt<ContactsRepositoryImpl>(),
              ),
            ),
            child: const ContactsPage(),
          ),
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
          opaque: true,
          type: PageTransitionType.fade,
        );
      default:
        return null;
    }
  }
}
