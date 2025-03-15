import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/person/view_model/person_view_model.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  // void _addNewPerson(Person? person) {
  //   if (person == null) return;
  //   setState(() {
  //     persons.add(person);
  //   });
  // }
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(personProvider.notifier).getAllPersons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final personState = ref.watch(personProvider);

    return Scaffold(
      body:
          personState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : personState.errorMessage != null
              ? Center(child: Text("Error: ${personState.errorMessage}"))
              : personState.personList.isEmpty
              ? Center(child: Text("No Person available"))
              : ListView.builder(
                itemCount: personState.personList.length,
                itemBuilder: (context, index) {
                  final person = personState.personList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          person.imageUrl != null
                              ? MemoryImage(person.imageUrl!)
                              : null,
                    ),
                    title: Text(person.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (person.contactNumber?.international.isNotEmpty ??
                            false)
                          Text(person.contactNumber?.international ?? ''),
                        if (person.email != null) Text(person.email!),
                      ],
                    ),
                    trailing: Text(
                      '\$${person.owedAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed<bool>(AppPage.newPersonScreen.name);
          ref.read(personProvider.notifier).getAllPersons();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
