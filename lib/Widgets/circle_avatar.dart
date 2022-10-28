import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double circleRadius;
  // final Color? backgroundColor;
  final Widget child;
  final int? boderWidth;

  const CircleImage({
    Key? key,
    required this.circleRadius,
    required this.child,
    // this.backgroundColor = Colors.black,
    this.boderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // backgroundColor: backgroundColor,
      radius: circleRadius,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(circleRadius - boderWidth!),
          child: child,
        ),
      ),
    );
  }
}
