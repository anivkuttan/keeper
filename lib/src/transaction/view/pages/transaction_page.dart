import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/person/model/person.dart';
import 'package:keeper/src/person/view_model/cubit/person/person_cubit.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';
import 'package:keeper/src/shared/widgets/app_dropdown_button.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/attachement_button.dart';
import 'package:keeper/src/transaction/view/widgets/image_preview_row_widget.dart';
import 'package:keeper/src/transaction/view_model/cubit/transaction_cubit.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // DropDownType? currentWallet;
  // List<Uint8List> pickedImages = [];
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController amountController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    amountController = TextEditingController(text: '');
    context.read<PersonCubit>().getAllPersons();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                "Expense",
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              centerTitle: true,
              collapsedHeight: 200,
              expandedHeight: 200,

              flexibleSpace: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "How much?",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColor.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "₹",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            onChanged:
                                (value) => context
                                    .read<TransactionCubit>()
                                    .updateTransaction(
                                      amount: double.tryParse(value),
                                    ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "0",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textAlign: TextAlign.start,
                            cursorColor: Colors.white,
                            showCursor: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10),
                  _buildDropdownButton(),
                  SizedBox(height: 10),
                  _buildPerson(),
                  SizedBox(height: 10),
                  _buildTextField("Description"),
                  SizedBox(height: 10),
                  _buildImagePreview(),
                  SizedBox(height: 10),
                  _buildAttachmentBox(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
                      final state = context.read<TransactionCubit>().state;
                      log(state.transaction.toString());
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerson() {
    return Row(
      children: [
        BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            return Expanded(
              child: SizedBox(
                height: 60,
                child:
                    (state.personList?.isNotEmpty ?? false)
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state.personList?.length,
                          itemBuilder: (context, index) {
                            final image = state.personList?[index].profileImage;
                            return CircleAvatar(
                              backgroundImage:
                                  image != null ? MemoryImage(image) : null,
                            );
                          },
                        )
                        : null,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () async {
            final List<Person>? selectedPerson =
                await showAdaptiveDialog<List<Person>>(
                  context: context,
                  builder: (context) {
                    return PersonBottomsheetView();
                  },
                );
            if (!mounted) return;
            context.read<TransactionCubit>().updateTransaction(
              personList: selectedPerson,
            );
          },
          child: Text("persons"),
        ),
      ],
    );
  }

  Widget _buildDropdownButton() {
    return BlocSelector<TransactionCubit, TransactionState, DropDownType?>(
      selector: (state) {
        return state.transaction.method;
      },
      builder: (context, method) {
        return AppDropDownButton(
          hint: "Wallet",
          onChanged: (value) {
            context.read<TransactionCubit>().updateTransaction(method: value);
          },
          value: method,
          validator: (value) => value == null ? "Please select a wallet" : null,

          items: [
            DropDownType(displayValue: "Hand-Cash", id: "1"),
            DropDownType(displayValue: "G-Pay", id: "2"),
            DropDownType(displayValue: "Phone-Pay", id: "3"),
            DropDownType(displayValue: "CRUD", id: "4"),
            DropDownType(displayValue: "Back Account", id: "5"),
            DropDownType(displayValue: "Mobile Recharge", id: "5"),
            DropDownType(displayValue: "Other", id: "6"),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String hint) {
    return AppTextForm(
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter $hint";
        }
        return null;
      },
      onChanged:
          (value) =>
              context.read<TransactionCubit>().updateTransaction(note: value),
    );
  }

  Widget _buildAttachmentBox() {
    return AttachementButton(
      imagePicked: (image) {
        var imageList =
            context.read<TransactionCubit>().state.transaction.attachmentList;
        if (imageList != null) {
          imageList.add(image);
        } else {
          imageList = [image];
        }
        context.read<TransactionCubit>().updateTransaction(
          attachmentList: imageList,
        );
      },
    );
  }

  Widget _buildImagePreview() {
    return BlocSelector<TransactionCubit, TransactionState, List<Uint8List>>(
      selector: (state) {
        return state.transaction.attachmentList ?? [];
      },
      builder: (context, attachmentList) {
        return ImagePreViewRow(
          pickedImages: attachmentList,
          onImageRemoved: (int value) {
            attachmentList.removeAt(value);
            context.read<TransactionCubit>().updateTransaction(
              attachmentList: attachmentList,
            );
          },
        );
      },
    );
  }
}

class PersonBottomsheetView extends StatefulWidget {
  const PersonBottomsheetView({super.key});

  @override
  State<PersonBottomsheetView> createState() => _PersonBottomsheetViewState();
}

class _PersonBottomsheetViewState extends State<PersonBottomsheetView> {
  final List<Person> selectedPersons = [];
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<PersonCubit, PersonCubitState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Select All Checkbox
              CheckboxListTile(
                title: const Text('Select All'),
                value: isSelectAll,
                onChanged: (value) {
                  setState(() {
                    isSelectAll = value ?? false;
                    selectedPersons.clear();
                    if (isSelectAll) {
                      selectedPersons.addAll(state.personList);
                    }
                  });
                },
              ),
              const Divider(),
              // List of Persons
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.personList.length,
                  itemBuilder: (context, index) {
                    final person = state.personList[index];
                    final isSelected = selectedPersons.contains(person);

                    return ListTile(
                      title: Text(person.name),
                      trailing: Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              selectedPersons.add(person);
                            } else {
                              selectedPersons.remove(person);
                            }
                            // Update select all status
                            isSelectAll =
                                selectedPersons.length ==
                                state.personList.length;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Do something with selectedPersons
                  Navigator.pop(context, selectedPersons);
                },
                child: const Text('Done'),
              ),
            ],
          );
        },
      ),
    );
  }
}
