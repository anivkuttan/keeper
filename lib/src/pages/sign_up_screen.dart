import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/shared/widgets/app_button.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/pages/sign_in_screen.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(personProvider.notifier);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: Image.asset(AppImage.signUpBG)),
            AppTextForm(
              hintText: 'Name',
              onChanged: (value) => viewModel.updatePerson(name: value),
            ),

            AppTextForm(
              hintText: 'Email',
              onChanged: (value) => viewModel.updatePerson(email: value),
            ),

            PhoneField(
              validator: PhoneValidator.compose([
                PhoneValidator.required(
                  context,
                  errorText: "You must enter a value",
                ),
                PhoneValidator.validMobile(context),
              ]),
              onChanged:
                  (value) => viewModel.updatePerson(contactNumber: value),
            ),

            AppTextForm(
              hintText: 'Password',
              isPassword: true,
              onChanged: (value) => viewModel.updatePerson(password: value),
            ),

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
            AppButton(
              onTap:
                  _agreeToTerms
                      ? () async {
                        final isSuccess =
                            await ref
                                .read(personProvider.notifier)
                                .createOnePerson();

                        if (isSuccess) {
                          if (!context.mounted) return;
                          final login =
                              await ref.read(personProvider.notifier).logIn();
                          if (!context.mounted) return;
                          if (login) {
                            context.goNamed(AppPage.homeScreen.name);
                          }
                        }
                      }
                      : null,
              title: 'Sign Up',
            ),
            Spacer(),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClickableText(
                    prefixText: 'Already have an account? ',
                    clickableText: 'SignIn',
                    onTap: () {
                      context.pushReplacement(AppPage.signInScreen.path);
                    },
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
    this.onChanged,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
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
