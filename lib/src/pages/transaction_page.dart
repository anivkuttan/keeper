import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';
import 'package:keeper/src/shared/widgets/app_dropdown_button.dart';
import 'package:keeper/src/shared/widgets/app_text_field.dart';
import 'package:keeper/src/shared/widgets/attachement_button.dart';
import 'package:keeper/src/transaction/view/widgets/image_preview_row_widget.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  DropDownType? currentWallet;
  List<Uint8List> pickedImages = [];
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController amountController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    amountController = TextEditingController(text: '');
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
              padding: EdgeInsets.all(12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 15),
                  _buildDropdownButton(),
                  SizedBox(height: 15),
                  _buildTextField("Description"),
                  SizedBox(height: 15),
                  _buildImagePreview(),
                  SizedBox(height: 15),
                  _buildAttachmentBox(),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
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

      // Expanded(
      //   child: Container(
      //     padding: EdgeInsets.all(20),
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      //     ),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         SizedBox(height: 15),
      //         _buildDropdownButton(),
      //         SizedBox(height: 15),
      //         _buildTextField("Description"),
      //         SizedBox(height: 15),
      //         _buildImagePreview(),
      //         SizedBox(height: 15),
      //         _buildAttachmentBox(),

      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: AppColor.primaryColor,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             padding: EdgeInsets.symmetric(vertical: 15),
      //           ),
      //           onPressed: () {
      //             _formKey.currentState!.validate();
      //           },
      //           child: Text(
      //             "Continue",
      //             style: TextStyle(fontSize: 18, color: Colors.white),
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //       ],
      //     ),
      //   ),
      // ),
      //   ],
      // ),
    );
  }

  Widget _buildDropdownButton() {
    return AppDropDownButton(
      hint: "Wallet",
      onChanged: (value) {
        setState(() {
          currentWallet = value;
        });
      },
      value: currentWallet,
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
    );
  }

  Widget _buildAttachmentBox() {
    return AttachementButton(
      imagePicked: (image) {
        pickedImages.add(image);
        setState(() {});
      },
    );
  }

  Widget _buildImagePreview() {
    return ImagePreViewRow(
      pickedImages: pickedImages,
      onImageRemoved: (int value) {
        pickedImages.removeAt(value);
        setState(() {});
      },
    );
  }
}
