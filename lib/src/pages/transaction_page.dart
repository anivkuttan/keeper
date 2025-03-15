import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:keeper/core/theme/theme.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';
import 'package:keeper/src/shared/widgets/app_dropdown_button.dart';
import 'package:keeper/src/shared/widgets/attachement_button.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  DropDownType? currentWallet;
  List<Uint8List> pickedImages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            child: AppBar(
              backgroundColor: Colors.red,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              title: Text("Expense", style: TextStyle(color: Colors.white)),
              centerTitle: true,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "How much?",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          TextFormField(
            autofocus: false,
            onTapOutside: (f) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration.collapsed(
              hintText: "0",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
            showCursor: false,

            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
                  _buildDropdownButton(),
                  SizedBox(height: 15),
                  _buildTextField("Description"),
                  SizedBox(height: 15),
                  _buildImagePreview(),
                  SizedBox(height: 15),
                  _buildAttachmentBox(),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
      items: [
        DropDownType(displayValue: "Hand-Cash", id: "1"),
        DropDownType(displayValue: "G-Pay", id: "2"),
        DropDownType(displayValue: "Phone-Pay", id: "3"),
        DropDownType(displayValue: "CRUD", id: "4"),
        DropDownType(displayValue: "Back Account", id: "5"),
        DropDownType(displayValue: "Mobile Recharge", id: "5"),
      ],
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      maxLines: 5,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
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

class ImagePreViewRow extends StatelessWidget {
  const ImagePreViewRow({
    super.key,
    required this.pickedImages,
    required this.onImageRemoved,
  });

  final List<Uint8List> pickedImages;
  final ValueChanged<int> onImageRemoved;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(pickedImages.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  pickedImages[index],
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => onImageRemoved(index),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withValues(alpha: .7),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
// import 'package:flutter/material.dart';

// class ImagePreview extends StatefulWidget {
//   @override
//   _ImagePreviewState createState() => _ImagePreviewState();
// }

// class _ImagePreviewState extends State<ImagePreview> {
//   List<String> imagePaths = [
//     "assets/image1.png", // Replace with your image paths
//     "assets/image2.png",
//   ];

//   void removeImage(int index) {
//     setState(() {
//       imagePaths.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ,
//       ),
//     );
//   }
// }
