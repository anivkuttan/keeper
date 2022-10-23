

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keeper/Controllers/notes_controller.dart';
import 'package:keeper/Model/notes.dart';

class AddNotesPage extends StatefulWidget {
  final Notes? notes;
  final int ? index;
  const AddNotesPage({Key? key, this.notes, this.index}) : super(key: key);

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final NotesController notesController = Get.find<NotesController>();

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  void initState() {
    super.initState();
    setController();
  }

  void setController() {
    Notes? notes = widget.notes;

    if (notes == null) {
      _titleController.clear();
      _noteController.clear();
    } else {
      _noteController.text = notes.notes;
      _titleController.text = notes.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNotes'),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              controller: _titleController,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Please Enter title";
                }else{
                  return null;
                }
                
              },
              decoration: InputDecoration(
                hintText: "PicK the Date",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range_rounded),
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2100));
                    _titleController.text =
                        "${date!.day}/${date.month}/${date.year}";
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              maxLines: 20,
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          bool isValitate = formkey.currentState!.validate();
          if (isValitate) {
            Notes newNote = Notes(
              title: _titleController.text,
              notes: _noteController.text,
            );
           
           widget.notes==null? notesController.addNotes(newNote):notesController.updateNotes(newNote,widget.index!);
           
            Navigator.pop(context);
          } else {
           return;
          }
        },
      ),
    );
  }
}
