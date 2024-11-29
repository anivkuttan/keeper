import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const Button({
    super.key,
    required this.buttonName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(23)),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: const StadiumBorder(),
        ),
        child: Text(
          buttonName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final void Function() buttonTaped;
  const DialogButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTaped});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: buttonTaped,
      style: TextButton.styleFrom(foregroundColor: buttonColor),
      child: Text(buttonText),
    );
  }
}
