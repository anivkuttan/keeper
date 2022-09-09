import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Model/person.dart';
import 'package:keeper/Model/task.dart';
import 'package:keeper/Service/db_repository.dart';
import 'Pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Person>(PersonAdapter());
  Hive.registerAdapter<Task>(TaskAdapter());
  await DbRepository.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
