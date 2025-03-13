import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/person/model/person.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final List<Person> persons = [
    Person(
      name: 'John Doe',
      contactNumber: '+1 555 123 456',
      email: 'johndoe@gmail.com',
      owedAmount: 100.0,
    ),
    Person(
      name: 'Jane Smith',
      contactNumber: '+1 555 654 321',
      owedAmount: 250.0,
    ),
  ];

  void _addNewPerson(Person? person) {
    if (person == null) return;
    setState(() {
      persons.add(person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
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
                Text('Contact: ${person.contactNumber}'),
                if (person.email != null) Text('Email: ${person.email!}'),
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
          final person = await context.pushNamed<Person>(
            AppPage.newPersonScreen.name,
          );

          _addNewPerson(person);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
