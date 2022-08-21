import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/notes_controller.dart';
import 'package:keeper/Model/notes.dart';
import 'package:keeper/Pages/add_notes.dart';

class ViewNotes extends StatelessWidget {
  ViewNotes({Key? key}) : super(key: key);
  final NotesController notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viwe Notes'),
      ),
      body: Obx(
        (() => notesController.listOfNotes.isEmpty
            ? const Center(child: Text("Empty List"))
            : ListView.builder(
                itemCount: notesController.listOfNotes.length,
                itemBuilder: ((context, index) {
                  Notes notes = notesController.listOfNotes[index];

                  return ListTile(
                    title: Text(notes.title),
                    onTap: () {
                      Route route = MaterialPageRoute(builder: (context) {
                        return AddNotesPage(
                          notes: notes,
                        );
                      });
                      Navigator.push(context, route);
                    },
                  );
                }),
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) {
            return const AddNotesPage();
          });
          Navigator.push(context, route);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
