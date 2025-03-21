import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/view_model/cubit/person/person_cubit.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<PersonCubit>().getAllPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Persons"), centerTitle: true),
      body: BlocBuilder<PersonCubit, PersonCubitState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.personList.isEmpty) {
            return Center(child: Text("No Person fount"));
          }
          return ListView.builder(
            itemCount: state.personList.length,
            itemBuilder: (context, index) {
              final person = state.personList[index];
              return PersonListTile(person: person);
            },
          );
        },
      ),

      // Center(child: Text("No Person available")),

      // personState.isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : personState.errorMessage != null
      //     ? Center(child: Text("Error: ${personState.errorMessage}"))
      //     : personState.personList.isEmpty
      //     ? Center(child: Text("No Person available"))
      //     : ListView.separated(
      //       padding: EdgeInsets.all(8),
      //       itemCount: personState.personList.length,
      //       itemBuilder: (context, index) {
      //         return PersonListTile(
      //           person: personState.personList[index],

      //           onEdit: () {
      //             // Handle edit action
      //           },
      //           onDelete: () {
      //             // Handle delete action
      //           },
      //         );
      //       },
      //       separatorBuilder: (context, index) {
      //         return SizedBox(height: 10);
      //       },
      //     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed<bool>(AppPage.newPersonScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PersonListTile extends StatelessWidget {
  const PersonListTile({
    super.key,
    required this.person,
    this.onDelete,
    this.onEdit,
  });
  final Person person;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppPage.personDetails.name, extra: person);
      },
      child: Container(
        color: AppColor.secondry,
        height: 70,
        child: Row(
          children: [
            Expanded(flex: 2, child: Container(child: leadingWidget())),
            Expanded(flex: 8, child: Container(child: nameWidget())),
            Expanded(flex: 1, child: Container(child: optionWidget())),
          ],
        ),
      ),
    );
  }

  Widget leadingWidget() {
    return CircleAvatar(
      radius: 40,
      backgroundImage:
          person.profileImage != null
              ? MemoryImage(person.profileImage!)
              : null,
    );
  }

  Widget nameWidget() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person, size: 20),
              Icon(Icons.phone, size: 20),
              Icon(Icons.timer_sharp, size: 20),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.name),
              Text(person.phoneNumber.international),
              Text(person.updatedAt?.toIso8601String() ?? ''),
            ],
          ),
        ),
      ],
    );
  }

  Widget optionWidget() {
    return IconButton(onPressed: () {}, icon: Icon(Icons.delete));
  }
}
