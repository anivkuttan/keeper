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
        title: const Text("View Notes"),
      ),
      body: GetBuilder<NotesController>(
        builder: (controller) {
          if(controller.noteBox.length==0){
            return const Center(child:Text('Empty List'))
;          }
          return ListView.builder(
            itemCount: controller.noteBox.length,
            itemBuilder: ((context, index) {
              Notes? notes = controller.noteBox.getAt(index);
              return  ListTile(title:Text(notes!.title),
              subtitle: Text(notes.notes),
              onTap: (() {
                 Route route = MaterialPageRoute(builder: (context) {
            return  AddNotesPage(notes: notes,index:index);
          });
          Navigator.push(context, route);
              }),
              onLongPress: () {
                 showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                    height: 100,
                    width: 400,
                    child: Column(
                      children: [
                        Text('Do You Want to delete ${notes.title} ?'),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () {
                               notesController.deleteNote(index);
                              
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              );
            });
              },
              );
            }),
          );
        },
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
