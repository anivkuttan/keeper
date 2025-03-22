import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/const/enums.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/view_model/cubit/new_person/new_person_cubit.dart';
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
      child: ListTile(
        tileColor: AppColor.secondry,
        leading: leadingWidget(),
        title: Text(person.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(person.flullNumber ?? ""),
            Text(person.about ?? ''),
            Text(person.amount.toStringAsFixed(3)),
            Text(person.updatedAt?.toIso8601String() ?? '-'),
          ],
        ),
        trailing: optionWidget(context),
      ),
    );
  }

  Widget leadingWidget() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.purple,
      backgroundImage:
          person.profileImage != null
              ? MemoryImage(person.profileImage!)
              : null,
    );
  }

  Widget optionWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.red),
        ),
        IconButton(
          onPressed: () {
            context.read<NewPersonCubit>().loadOnePerson(person);
            context.pushNamed(AppPage.newPersonScreen.name);
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}
