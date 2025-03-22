import 'package:get_it/get_it.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/src/login/modal/repo/login_local.dart';
import 'package:keeper/src/login/view_model/cubit/login_cubit.dart';
import 'package:keeper/src/person/view_model/cubit/new_person/new_person_cubit.dart';
import 'package:keeper/src/person/view_model/cubit/person/person_cubit.dart';
import 'package:keeper/src/transaction/view_model/cubit/transaction_cubit.dart';

final getIt = GetIt.instance;

void dependancyInit() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerFactory(() => LoginLocal(getIt()));
  getIt.registerFactory(() => LoginCubit(getIt()));
  getIt.registerFactory(() => NewPersonCubit());
  getIt.registerFactory(() => PersonCubit(getIt()));
  getIt.registerFactory(() => TransactionCubit());
}
