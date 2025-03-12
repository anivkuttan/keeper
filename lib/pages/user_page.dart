import 'package:flutter/material.dart';

class Person {
  final String name;
  final String contactNumber;
  final String? email; // optional
  final String imageUrl;
  final double owedAmount;

  Person({
    required this.name,
    required this.contactNumber,
    this.email,
    required this.imageUrl,
    required this.owedAmount,
  });
}

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
      imageUrl: 'https://via.placeholder.com/150',
      owedAmount: 100.0,
    ),
    Person(
      name: 'Jane Smith',
      contactNumber: '+1 555 654 321',
      imageUrl: 'https://via.placeholder.com/150',
      owedAmount: 250.0,
    ),
  ];

  void _addNewPerson(Person person) {
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
              backgroundImage: NetworkImage(person.imageUrl),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPersonPage(onAddPerson: _addNewPerson),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewPersonPage extends StatefulWidget {
  final Function(Person) onAddPerson;

  const NewPersonPage({super.key, required this.onAddPerson});

  @override
  State createState() => _NewPersonPageState();
}

class _NewPersonPageState extends State<NewPersonPage> {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _imageController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email (Optional)'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Image URL (Placeholder or URL)',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Owed Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final person = Person(
                  name: _nameController.text,
                  contactNumber: _contactController.text,
                  email:
                      _emailController.text.isEmpty
                          ? null
                          : _emailController.text,
                  imageUrl:
                      _imageController.text.isEmpty
                          ? 'https://via.placeholder.com/150'
                          : _imageController.text,
                  owedAmount: double.parse(_amountController.text),
                );
                widget.onAddPerson(person);
                Navigator.pop(context);
              },
              child: const Text('Add Person'),
            ),
          ],
        ),
      ),
    );
  }
}
