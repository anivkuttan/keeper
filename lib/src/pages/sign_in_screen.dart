import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';
import 'package:keeper/src/shared/widgets/app_button.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(personProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: Image.asset(AppImage.signInBG)),
            const SizedBox(height: 16),
            PhoneField(
              hintText: 'Phone Number *',
              onChanged: (value) => viewModel.updatePerson(phoneNumber: value),
            ),
            const SizedBox(height: 16),
            AppTextForm(
              hintText: 'Password *',
              isPassword: true,
              onChanged: (value) => viewModel.updatePerson(password: value),
            ),
            const SizedBox(height: 24),
            AppButton(
              title: 'SignIn',
              onTap: () async {
                final isSccuss =
                    await ref.watch(personProvider.notifier).logIn();
                if (isSccuss) {
                  if (!context.mounted) return;
                  context.goNamed(AppPage.homeScreen.name);
                } else {
                  if (!context.mounted) return;

                  final errorMessage =
                      ref.read(personProvider).errorMessage ?? "Login failed!";
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(errorMessage)));
                }
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle Forgot Password tap
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClickableText(
                    prefixText: 'Don’t have an account yet? ',
                    clickableText: 'Sign Up',
                    onTap: () {
                      context.pushReplacement(AppPage.signUpScreen.path);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  final String prefixText;
  final String clickableText;
  final TextStyle? prefixStyle;
  final TextStyle? clickableStyle;
  final VoidCallback onTap;

  const ClickableText({
    super.key,
    required this.prefixText,
    required this.clickableText,
    required this.onTap,
    this.prefixStyle,
    this.clickableStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixText,
        style: prefixStyle ?? TextStyle(color: Colors.grey),
        children: [
          TextSpan(
            text: clickableText,
            style:
                clickableStyle ??
                TextStyle(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
