import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keeper/Controllers/person_controller.dart';
import 'package:keeper/Model/task.dart';

class AddTaskPage extends StatefulWidget {
  final String? buttonName;
  const AddTaskPage({Key? key, this.buttonName}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final PersonController controller = Get.find<PersonController>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _taskNameController = TextEditingController();
  final editedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task to All'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _taskNameController,
                  validator: (currentText) {
                    if (currentText == null || currentText.isEmpty) {
                      return 'Please Enter Task Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    label: const Text("Task Name"),
                    counterText: "$editedTime",
                  ),
                ),
                const SizedBox(height: 30),
                const Text("Task Amount"),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      OutlinedButton(
                        child: const Text("-1"),
                        onPressed: () {
                          controller.counterDecrement('1');
                        },
                      ),
                      OutlinedButton(
                        child: const Text("-10"),
                        onPressed: () {
                          controller.counterDecrement('10');
                        },
                        onLongPress: () {
                          controller.counterDecrement("100");
                        },
                      )
                    ]),
                    Obx(() {
                      return Text(
                        "${controller.taskAmountCount.value}",
                        style: const TextStyle(fontSize: 100),
                      );
                    }),
                    Column(children: [
                      OutlinedButton(
                        child: const Text("+1"),
                        onPressed: () {
                          controller.counterIncrment('+1');
                        },
                      ),
                      OutlinedButton(
                        child: const Text("+10"),
                        onPressed: () {
                          controller.counterIncrment('+10');
                        },
                        onLongPress: () {
                          controller.counterIncrment('+100');
                        },
                      ),
                    ])
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text("Apply to "),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 260,
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.personList.length,
                      itemBuilder: ((context, index) {
                        final person = controller.personList[index];
                        return CheckboxListTile(
                            title: Text(person.personName),
                            value: widget.buttonName == "SomeOne" ? true : person.isSelected,
                            subtitle: person.isSelected
                                ? Obx((() => Text(
                                    'Amount : ${person.personAmount} + (${controller.taskAmountCount.value}) = ${person.personAmount + controller.taskAmountCount.value}')),)
                                : Text("Amount : ${person.personAmount}"),
                            onChanged: (value) {
                              setState(() {
                                person.isSelected = value!;
                              });
                            });
                      }),
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("save"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SnackBar snackBar = const SnackBar(
                          content: Text('Task Added'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        );
                        Task newTask = Task(
                            taskName: _taskNameController.text,
                            taskAmount: controller.taskAmountCount.value,
                            editedTime: editedTime);

                        if (widget.buttonName == "All") {
                          addTaskToAllFunction(newTask);
                        } else if (widget.buttonName == "SomeOne") {
                          addTaskToSomeOneFunction(newTask);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }

  addTaskToAllFunction(Task task) {
    for (var person in controller.personList) {
      person.listOfTask.add(task);
      person.personAmount += controller.taskAmountCount.value;
    }
  }

  addTaskToSomeOneFunction(Task task) {
    for (var person in controller.personList) {
      if (person.isSelected) {
        person.listOfTask.add(task);
        person.personAmount += controller.taskAmountCount.value;
      } else {
        null;
      }
    }
  }
}
