import 'package:flutter/material.dart';

class AddNotesPage extends StatelessWidget {
  AddNotesPage({Key? key}) : super(key: key);
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNotes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range_rounded),
                  onPressed: () {
                    // dateController.text = showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(2010),
                    //         lastDate: DateTime(2100))
                    //     .toString();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
