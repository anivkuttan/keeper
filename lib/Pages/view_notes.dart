import 'package:flutter/material.dart';
import 'package:keeper/Pages/add_notes.dart';

class ViewNotes extends StatelessWidget {
  const ViewNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viwe Notes'),
      ),
      body: const Center(
        child: Text('Empty Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) {
            return  AddNotesPage();
          });
          Navigator.push(context, route);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
