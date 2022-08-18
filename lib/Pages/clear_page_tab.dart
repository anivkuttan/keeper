import 'package:flutter/material.dart';

class ClearPageTabView extends StatefulWidget {
  const ClearPageTabView({Key? key}) : super(key: key);

  @override
  State<ClearPageTabView> createState() => _ClearPageTabViewState();
}

class _ClearPageTabViewState extends State<ClearPageTabView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Text("To to Cleared Task update version")),
    );
  }
}
