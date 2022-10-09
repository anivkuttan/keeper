import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double circleRadius;

  final Widget child;

  const CircleImage({Key? key, required this.circleRadius, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: circleRadius,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(circleRadius - 1),
          child: child,
        ),
      ),
    );
  }
}
