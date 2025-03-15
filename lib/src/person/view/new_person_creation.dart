import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
import 'package:keeper/src/shared/widgets/profile_image.dart';
import 'package:phone_form_field/phone_form_field.dart';

class NewPersonPage extends ConsumerWidget {
  const NewPersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personState = ref.watch(personProvider);
    final viewModel = ref.read(personProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("New Person Creating"), centerTitle: true),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  ProfileImage(
                    onImagePicked:
                        (value) => viewModel.updatePerson(
                          imageUrl: value,
                          removeImage: value == null,
                        ),
                  ),
                  AppTextForm(
                    hintText: "Name *",
                    suffixIcon: Icon(Icons.person),
                    onChanged: (value) => viewModel.updatePerson(name: value),
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
                        (value) => viewModel.updatePerson(contactNumber: value),
                  ),
                  AppTextForm(
                    hintText: 'Email (Optional)',
                    suffixIcon: Icon(Icons.email),
                    onChanged: (value) => viewModel.updatePerson(email: value),
                  ),
                  AppTextForm(
                    hintText: 'Initial Amount',
                    keyboardType: TextInputType.number,
                    suffixIcon: Icon(Icons.money),
                    onChanged:
                        (value) => viewModel.updatePerson(
                          owedAmount: double.tryParse(value) ?? 0.0,
                        ),
                  ),

                  ElevatedButton(
                    onPressed:
                        personState.isLoading
                            ? null
                            : () async {
                              final success = await viewModel.createOnePerson();
                              if (success) {
                                if (!context.mounted) return;
                                context.pop(true);
                              } else {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Failed to create person!"),
                                  ),
                                );
                              }
                            },
                    child:
                        personState.isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Submit"),
                  ),

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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
