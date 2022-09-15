import 'package:flutter/material.dart';
import 'package:keeper/Model/person.dart';

class ViewPage extends StatefulWidget {
  final Person person;
  const ViewPage({Key? key, required this.person}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'Image',
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(60),
                  child: widget.person.personImage != null
                      ? Image.memory(
                          widget.person.personImage!,
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          child: Text(
                            widget.person.personName[0].toUpperCase(),
                          ),
                        ),
                ),
              ),
            ),
          ),
          Text(
            widget.person.personName,
            style: const TextStyle(fontSize: 40),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount:1,
                  itemBuilder: (context, index) {
                    return  Text('${widget.person.listOfTask[index]}');
                  }),),
        ],
      )),
    );
  }
}
