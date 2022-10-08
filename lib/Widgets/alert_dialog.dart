import 'package:flutter/material.dart';
import 'package:keeper/Widgets/button.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final void Function() yesButtonTaped;
  final void Function() noButtonTaped;
  const DialogBox(
      {Key? key,
      required this.title,
      required this.yesButtonTaped,
      required this.noButtonTaped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        DialogButton(
          buttonText: "Yes",
          buttonColor: Colors.blue,
          buttonTaped: yesButtonTaped,
        ),
        DialogButton(
          buttonText: "No",
          buttonColor: Colors.red,
          buttonTaped: noButtonTaped,
        )
      ],
    );
  }
}
