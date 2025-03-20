import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/app_image.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/login/view_model/cubit/login_cubit.dart';
import 'package:keeper/src/shared/widgets/app_button.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      body: BlocListener<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.info?.message ?? '')));
            context.read<LoginCubit>().resetStateStatus();
          }
          if (state.status == LoginStatus.success) {
            context.goNamed(AppPage.homeScreen.name);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.info?.message ?? '')));
            context.read<LoginCubit>().resetLoginState();
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 2, child: Image.asset(AppImage.signInBG)),
                const SizedBox(height: 16),
                PhoneField(
                  hintText: 'Phone Number *',
                  onChanged:
                      (value) => context.read<LoginCubit>().updatePerson(
                        phoneNumber: value,
                      ),
                  initialValue: PhoneNumber(
                    isoCode: IsoCode.IN,
                    nsn: "9092343966",
                  ),
                  validator: PhoneValidator.compose([
                    PhoneValidator.required(
                      context,
                      errorText: "You must enter a value",
                    ),
                    PhoneValidator.validMobile(context),
                  ]),
                ),
                const SizedBox(height: 16),
                AppTextForm(
                  hintText: 'Password *',
                  isPassword: true,
                  validator: (p0) {
                    final value = p0?.trim();
                    if (value == null || value.isEmpty) {
                      return "please Enter value";
                    }
                    return null;
                  },
                  onChanged:
                      (value) => context.read<LoginCubit>().updatePerson(
                        password: value,
                      ),
                ),
                const SizedBox(height: 24),
                siginButton(context),
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
        ),
      ),
    );
  }

  Widget siginButton(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, state) {
            return AppButton(
              title: 'SignIn',
              onTap:
                  state.status == LoginStatus.loading
                      ? null
                      : () async {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          await context.read<LoginCubit>().signIn();
                        }
                      },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(AppPage.db.name);
          },
          child: Text("DB"),
        ),
      ],
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
