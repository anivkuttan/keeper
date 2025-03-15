import 'package:flutter/material.dart';
import 'package:keeper/core/theme/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.title,
    this.onTap,
    this.isLoading = false,
    this.titleTextStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  const AppButton.secondry({
    super.key,
    this.title,
    this.onTap,
    this.isLoading = false,
    this.titleTextStyle,
    this.elevation,
    this.backgroundColor = AppColor.secondry,
    this.foregroundColor = AppColor.black,
  });

  final String? title;
  final VoidCallback? onTap;
  final bool isLoading;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: !isLoading ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
        ),
        child:
            isLoading
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title ?? ''),
                    const SizedBox(width: 20),
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 1.3,
                      ),
                    ),
                  ],
                )
                : Text(title ?? '', style: titleTextStyle),
      ),
    );
  }
}
