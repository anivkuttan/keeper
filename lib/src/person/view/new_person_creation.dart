import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/db/database.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';
import 'package:keeper/src/shared/widgets/phone_number_field.dart';
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

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) => viewModel.updatePerson(name: value),
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
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email (Optional)',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => viewModel.updatePerson(email: value),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Owed Amount'),
                  keyboardType: TextInputType.number,
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
          );
        },
      ),
    );
  }
}
