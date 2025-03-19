import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/login/view_model/cubit/login_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        forceMaterialTransparency: true,
      ),
      extendBodyBehindAppBar: true,
      body: Form(
        key: _formKey,
        child: BlocListener<LoginCubit, LoginCubitState>(
          listener: (context, state) {
            if (state.status == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.info?.message ?? '')),
              );
            }
            if (state.status == LoginStatus.success) {
              context.pop();
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300),
                  child: Image.asset(AppImage.signUpBG),
                ),
                const SignUpFormFields(),
                _TermsAndConditions(),
                signInButton(),
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
      ),
    );
  }

  BlocBuilder<LoginCubit, LoginCubitState> signInButton() {
    return BlocBuilder<LoginCubit, LoginCubitState>(
      builder: (context, loginCubitState) {
        return AppButton(
          onTap:
              (loginCubitState.person?.agreeToTerms ?? false)
                  ? () async {
                    final isValid = _formKey.currentState?.validate() ?? false;
                    if (isValid) {
                      await context.read<LoginCubit>().createOnePerson();
                    }
                  }
                  : null,
          title: 'Sign Up',
        );
      },
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
          onChanged:
              (value) => context.read<LoginCubit>().updatePerson(name: value),
        ),
        const SizedBox(height: 16),
        AppTextForm(
          hintText: 'Email',
          onChanged:
              (value) => context.read<LoginCubit>().updatePerson(email: value),
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
          onChanged:
              (value) =>
                  context.read<LoginCubit>().updatePerson(phoneNumber: value),
        ),
        const SizedBox(height: 16),
        AppTextForm(
          hintText: 'Password *',
          isPassword: true,
          validator:
              (p0) =>
                  p0?.trim().isEmpty ?? true ? 'Please Enter Password' : null,
          onChanged:
              (value) =>
                  context.read<LoginCubit>().updatePerson(password: value),
        ),
      ],
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, loginCubitState) {
            return Checkbox(
              value: loginCubitState.person?.agreeToTerms ?? false,
              onChanged: (value) {
                context.read<LoginCubit>().updatePerson(agreeToTerms: value);
              },
            );
          },
        ),
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
