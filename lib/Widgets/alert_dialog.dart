import 'package:flutter/material.dart';
import 'package:keeper/Widgets/button.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final String firstButtonName;
  final String secondButtonName;
  final Color firstButtonColor;
  final Color secondButtonColor;
  final void Function() firstButtonTaped;
  final void Function() secondButtonTaped;
  const DialogBox(
      {Key? key,
      required this.title,
      required this.firstButtonTaped,
      required this.secondButtonTaped,
      required this.firstButtonName,
      required this.secondButtonName,
      required this.firstButtonColor,
      required this.secondButtonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        DialogButton(
          buttonText: firstButtonName,
          buttonColor: firstButtonColor,
          buttonTaped: firstButtonTaped,
        ),
        DialogButton(
          buttonText: secondButtonName,
          buttonColor: secondButtonColor,
          buttonTaped: secondButtonTaped,
        )
      ],
    );
  }
}
