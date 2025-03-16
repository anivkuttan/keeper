import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:keeper/src/shared/widgets/profile_image.dart';
import 'package:phone_form_field/phone_form_field.dart';

class NewPersonPage extends ConsumerWidget {
  NewPersonPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personState = ref.watch(personProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Person Creating"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          ref.listen(personProvider, (previous, next) {
            if (next.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(next.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          });

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    ProfileImage(
                      onImagePicked:
                          (value) => ref
                              .read(personProvider.notifier)
                              .updatePerson(
                                imageUrl: value,
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
                          (value) => ref
                              .read(personProvider.notifier)
                              .updatePerson(name: value),
                    ),
                    PhoneField(
                      hintText: 'Phone Number *',

                      suffixIcon: Icon(Icons.phone_android_rounded),

                      validator: PhoneValidator.compose([
                        PhoneValidator.required(
                          context,
                          errorText: "You must enter a value",
                        ),
                        PhoneValidator.validMobile(context),
                      ]),
                      onChanged:
                          (value) => ref
                              .read(personProvider.notifier)
                              .updatePerson(phoneNumber: value),
                    ),
                    AppTextForm(
                      hintText: 'Email (Optional)',
                      suffixIcon: Icon(Icons.email),
                      onChanged:
                          (value) => ref
                              .read(personProvider.notifier)
                              .updatePerson(email: value),
                    ),
                    AppTextForm(
                      hintText: 'Initial Amount',
                      keyboardType: TextInputType.number,
                      suffixIcon: Icon(Icons.money),

                      onChanged:
                          (value) => ref
                              .read(personProvider.notifier)
                              .updatePerson(
                                owedAmount: double.tryParse(value) ?? 0.0,
                              ),
                    ),
                    AppTextForm(hintText: "About", maxLines: 3),
                    ElevatedButton(
                      onPressed:
                          personState.isLoading
                              ? null
                              : () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final success =
                                      await ref
                                          .read(personProvider.notifier)
                                          .createOnePerson();
                                  if (success.data??false) {
                                    if (!context.mounted) return;
                                    context.pop(true);
                                  } else {
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Failed to create person!",
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                      child:
                          personState.isLoading
                              ? const CircularProgressIndicator()
                              : const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/* 
                  ElevatedButton(
                    onPressed: () {
                      final db = getIt<AppDatabase>();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DriftDbViewer(db),
                        ),
                      );
                    },

                    child: Text("DB"),
                  ), */