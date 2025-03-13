import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';

class NewPersonPage extends ConsumerWidget {
  const NewPersonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personState = ref.watch(personProvider);
    final viewModel = ref.read(personProvider.notifier);

    return Scaffold(
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
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) => viewModel.updatePerson(name: value),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                  ),
                  keyboardType: TextInputType.phone,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      personState.isLoading
                          ? null
                          : () => viewModel.createOnePerson(),
                  child:
                      personState.isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Submit"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
