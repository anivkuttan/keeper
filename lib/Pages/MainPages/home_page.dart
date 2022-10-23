import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Controllers/theme_controller.dart';
import 'package:keeper/Pages/MainPages/clear_page_tab.dart';
import 'package:keeper/Pages/MainPages/home_page_tab.dart';
import 'package:keeper/Pages/MainPages/quick_page_tab.dart';
import 'package:keeper/Widgets/alert_dialog.dart';

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

  Future<bool?> askUserToExit() async {
    return showDialog<bool?>(
        context: context,
        builder: (context) {
          return DialogBox(
              title: 'Dou you want to close the app?',
              firstButtonName: "Yes",
              firstButtonColor: Colors.red,
              firstButtonTaped: () {
                Navigator.pop(context, true);
              },
              secondButtonName: "No",
              secondButtonColor: Colors.green,
              secondButtonTaped: () {
                Navigator.pop(context, false);
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final userChoice = await askUserToExit();
        return userChoice ?? false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          // backgroundColor: Colors.grey[300],
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
