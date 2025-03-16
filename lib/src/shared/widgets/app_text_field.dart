import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextForm extends StatefulWidget {
  const AppTextForm({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.onTap,
    this.isPassword = false,
    this.readOnly = false,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  bool passwordVisibility = false;

  @override
  initState() {
    super.initState();
    passwordVisibility = widget.isPassword;
  }

  void onPasswordVisibilityChange() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: passwordVisibility,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: widget.hintText,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    !passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: onPasswordVisibilityChange,
                )
                : widget.suffixIcon,
      ),
    );
  }
}
