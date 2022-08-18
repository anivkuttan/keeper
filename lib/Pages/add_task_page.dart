import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task to All'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  label: const Text("Task Name"),
                  counterText: "12/8/2022 5:40pm",
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
                      onPressed: () {},
                    ),
                    OutlinedButton(
                      child: const Text("-10"),
                      onPressed: () {},
                    )
                  ]),
                  const Text("2500", style: TextStyle(fontSize: 100)),
                  Column(children: [
                    OutlinedButton(
                      child: const Text("+1"),
                      onPressed: () {},
                    ),
                    OutlinedButton(
                      child: const Text("+10"),
                      onPressed: () {},
                    )
                  ])
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Apply to "),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return CheckboxListTile(
                        title: Text('Hello   $index'),
                        value: true,
                        subtitle: Text('amount 3$index+2500 = 2587'),
                        onChanged: (value) {});
                  }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height:40,
                width: double.infinity,
                child: ElevatedButton(child: const Text("save"), onPressed: () {}),
              )
            ]),
      ),
    );
  }
}
