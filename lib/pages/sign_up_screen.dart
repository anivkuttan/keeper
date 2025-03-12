import 'package:flutter/material.dart';
import 'package:keeper/core/shared/widgets/app_button.dart';
import 'package:keeper/core/theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppTextForm(hintText: 'Name'),
            const SizedBox(height: 16),
            const AppTextForm(hintText: 'Email'),
            const SizedBox(height: 16),
            const AppTextForm(hintText: 'Password', isPassword: true),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'By signing up, you agree to the ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of Service and Privacy Policy',
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(onTap: _agreeToTerms ? () {} : null, title: 'Sign Up'),
            Spacer(),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextForm extends StatelessWidget {
  const AppTextForm({
    super.key,
    this.controller,
    this.hintText,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        suffixIcon:
            isPassword
                ? IconButton(icon: Icon(Icons.visibility), onPressed: () {})
                : null,
      ),
    );
  }
}
