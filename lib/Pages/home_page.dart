import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keeper/Pages/clear_page_tab.dart';
import 'package:keeper/Pages/home_page_tab.dart';
import 'package:keeper/Pages/quick_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode),
            )
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
    );
  }
}
