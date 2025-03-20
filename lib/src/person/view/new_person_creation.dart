import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/src/person/view_model/cubit/new_person_cubit.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:keeper/src/shared/widgets/profile_image.dart';
import 'package:phone_form_field/phone_form_field.dart';

class NewPersonPage extends StatelessWidget {
  NewPersonPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPersonCubit, NewPersonCubitState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.pop();
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.info?.message ?? '')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Person Creating"),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  ProfileImage(
                    onImagePicked:
                        (value) => context.read<NewPersonCubit>().updatePerson(
                          profileImage: value,
                          removeImage: value == null,
                        ),
                  ),
                  AppTextForm(
                    hintText: "Name *",
                    suffixIcon: Icon(Icons.person),
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    onChanged:
                        (value) => context.read<NewPersonCubit>().updatePerson(
                          name: value,
                        ),
                  ),
                  PhoneField(
                    hintText: 'Phone Number *',
                    initialValue: PhoneNumber(
                      isoCode: IsoCode.IN,
                      nsn: "9092343966",
                    ),

                    suffixIcon: Icon(Icons.phone_android_rounded),

                    validator: PhoneValidator.compose([
                      PhoneValidator.required(
                        context,
                        errorText: "You must enter a value",
                      ),
                      PhoneValidator.validMobile(context),
                    ]),
                    onChanged:
                        (value) => context.read<NewPersonCubit>().updatePerson(
                          phoneNumber: value,
                        ),
                  ),
                  AppTextForm(
                    hintText: 'Email (Optional)',
                    suffixIcon: Icon(Icons.email),
                    onChanged:
                        (value) => context.read<NewPersonCubit>().updatePerson(
                          email: value,
                        ),
                  ),
                  AppTextForm(
                    hintText: 'Initial Amount',
                    keyboardType: TextInputType.number,
                    suffixIcon: Icon(Icons.money),

                    onChanged:
                        (value) => context.read<NewPersonCubit>().updatePerson(
                          amount: double.tryParse(value) ?? 0.0,
                        ),
                  ),
                  AppTextForm(hintText: "About", maxLines: 3),
                  newCreationButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget newCreationButton(BuildContext context) {
    return BlocBuilder<NewPersonCubit, NewPersonCubitState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state.status.isLoading
                  ? null
                  : () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await context.read<NewPersonCubit>().createOnePerson();
                    }
                  },
          child:
              state.status.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Submit"),
        );
      },
    );
  }
}
