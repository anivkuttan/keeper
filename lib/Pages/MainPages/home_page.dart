
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Controllers/theme_controller.dart';
import 'package:keeper/Pages/MainPages/clear_page_tab.dart';
import 'package:keeper/Pages/MainPages/home_page_tab.dart';
import 'package:keeper/Pages/MainPages/quick_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyTheme themeController = Get.find<MyTheme>();
  Box<dynamic> settingBox = Hive.box("Setting");
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  DateTime? lastPressed;

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    const maxDuration = Duration(seconds: 2);
    final isWarning =
        lastPressed == null || now.difference(lastPressed!) > maxDuration;

    if (isWarning) {
      lastPressed = now;
      SnackBar exitSnack =    const SnackBar(
        content: Text("Double Tap to Close The App"),
        duration: maxDuration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        shape: StadiumBorder(),
        // width: 300,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(exitSnack);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HomePage'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              Obx(
                () {
                  return Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) {
                        themeController.isDarkMode.value = value;
                        settingBox.put(
                            'Dark_Mode', themeController.isDarkMode.value);
                      });
                },
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                child: Text('Home'),
              ),
              Tab(
                child: Text('Quick'),
              ),
              Tab(child: Text('Cleaned')),
            ]),
          ),
          body: TabBarView(
            children: [
              HomePageTabView(),
              QuickPageTabView(),
              const ClearPageTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
