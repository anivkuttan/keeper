import 'package:get_it/get_it.dart';
import 'package:keeper/core/db/database.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}
