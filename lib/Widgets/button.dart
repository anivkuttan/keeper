import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final void Function() buttonTaped;
  const DialogButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTaped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonTaped,
      style: TextButton.styleFrom(foregroundColor: buttonColor),
      child: Text(buttonText),
    );
  }
}
