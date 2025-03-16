import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/pages/sign_in_screen.dart';
import 'package:keeper/src/shared/widgets/app_button.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final viewModel = ref.read(personProvider.notifier);
    // final agreeToTerms = ref.watch(agreeToTermsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        forceMaterialTransparency: true,
      ),
      extendBodyBehindAppBar: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImage.signUpBG),
              const SignUpFormFields(),
              _TermsAndConditions(),
              AppButton(
                onTap: null,
                // agreeToTerms
                //     ? () async {
                //       if (_formKey.currentState?.validate() ?? false) {
                //         final isSuccess = await viewModel.createOnePerson();
                //         if (isSuccess.data ?? false) {
                //           if (!context.mounted) return;
                //           final login = await viewModel.logIn();
                //           if (!context.mounted) return;
                //           if (login) {
                //             context.goNamed(AppPage.homeScreen.name);
                //           }
                //         } else {
                //           if (!context.mounted) return;
                //           ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(
                //               content: Text(isSuccess.message ?? ''),
                //             ),
                //           );
                //         }
                //       }
                //     }
                //     : null,
                title: 'Sign Up',
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClickableText(
                      prefixText: 'Already have an account? ',
                      clickableText: 'SignIn',
                      onTap:
                          () => context.pushReplacement(
                            AppPage.signInScreen.path,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextForm(
          hintText: 'Name *',
          validator:
              (p0) => p0?.trim().isEmpty ?? true ? 'Please Enter Name' : null,
          // onChanged: (value) => viewModel.updatePerson(name: value),
        ),
        const SizedBox(height: 16),
        AppTextForm(
          hintText: 'Email',
          // onChanged: (value) => viewModel.updatePerson(email: value),
        ),
        const SizedBox(height: 16),
        PhoneField(
          hintText: "Phone Number *",
          validator: PhoneValidator.compose([
            PhoneValidator.required(
              context,
              errorText: "You must enter a value",
            ),
            PhoneValidator.validMobile(context),
          ]),
          // onChanged: (value) => viewModel.updatePerson(phoneNumber: value),
        ),
        const SizedBox(height: 16),
        AppTextForm(
          hintText: 'Password *',
          isPassword: true,
          validator:
              (p0) =>
                  p0?.trim().isEmpty ?? true ? 'Please Enter Password' : null,
          // onChanged: (value) => viewModel.updatePerson(password: value),
        ),
      ],
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    // final agreeToTerms = ref.watch(agreeToTermsProvider);

    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By signing up, you agree to the ',
              style: const TextStyle(color: Colors.black),
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
    );
  }
}

// final agreeToTermsProvider = StateProvider<bool>((ref) => false);
