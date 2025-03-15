import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:keeper/src/shared/widgets/attachement_button.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key, this.imageBytes, this.onImagePicked});
  final Uint8List? imageBytes;
  final ValueChanged<Uint8List?>? onImagePicked;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  Uint8List? pickedImage;
  @override
  void initState() {
    super.initState();
    pickedImage = widget.imageBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  pickedImage != null ? MemoryImage(pickedImage!) : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    pickedImage == null ? Icons.add : Icons.delete,
                    size: 15,
                  ),
                  onPressed:
                      pickedImage != null
                          ? () {
                            pickedImage = null;
                            widget.onImagePicked?.call(null);
                            setState(() {});
                          }
                          : () async {
                            await imagePickerBottomSheet(
                              context,
                              onImagePicked: (value) {
                                pickedImage = value;
                                widget.onImagePicked?.call(value);
                                setState(() {});
                              },
                            );
                          },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
