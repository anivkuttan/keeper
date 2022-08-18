import 'package:flutter/material.dart';
import 'package:keeper/Model/task.dart';

import '../Model/person.dart';

class HomePageTabView extends StatefulWidget {
  const HomePageTabView({Key? key}) : super(key: key);

  @override
  State<HomePageTabView> createState() => _HomePageTabViewState();
}

class _HomePageTabViewState extends State<HomePageTabView> {
  List<Person> personitem = <Person>[
    Person(
      personName: "User1",
      personAmount: 120,
      listOfTask: [
        Task(taskName: "Sambar", taskAmount: 40, editedTime: DateTime.now()),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Colors.pink,
      alignment: Alignment.center,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return const PersonCard();
        }),
        itemCount: 14,
        separatorBuilder: (context, index) {
          return const Divider(height:20);
        },
      ),
    );
  }
}

class PersonCard extends StatefulWidget {
  const PersonCard({Key? key}) : super(key: key);

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "UserName",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Amount: 200',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("last Added Task : Sambar"),
                SizedBox(
                  height: 5,
                ),
                Text("EditedTime :2022/3/12")
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 40,
            )
          ],
        ),
      ),
    );
  }
}
