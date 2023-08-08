import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/contacts/data/datasources/contacts_remote_data_source.dart';
import '../../features/contacts/data/repositories/contacts_repository_impl.dart';
import 'dio.dart';
import 'popup.dart';
import 'router.dart';

final getIt = GetIt.instance;

Future<void> initializeApp() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(Popup());
  getIt.registerSingleton(ContactsRepositoryImpl(
      remoteDataSource: ContactsRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(AppRouter());
}
