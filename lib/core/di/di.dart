import 'package:get_it/get_it.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/src/login/modal/repo/login_local.dart';
import 'package:keeper/src/login/view_model/cubit/login_cubit.dart';

final getIt = GetIt.instance;

void dependancyInit() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerFactory(() => LoginLocal(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
}
