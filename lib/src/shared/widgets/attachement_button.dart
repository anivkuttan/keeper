import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/src/shared/widgets/image_picker.dart';

class AttachementButton extends StatefulWidget {
  const AttachementButton({super.key, this.imagePicked});
  final ValueChanged<Uint8List>? imagePicked;
  @override
  State<AttachementButton> createState() => _AttachementButtonState();
}

class _AttachementButtonState extends State<AttachementButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImageSource? source = await showModalBottomSheet<ImageSource?>(
          context: context,
          showDragHandle: true,
          builder: (context) {
            return UploadOptions();
          },
        );
        if (source == null) return;
        if (!context.mounted) return;
        final Uint8List? image = await pickImage(context, source: source);
        if (image == null) return;
        widget.imagePicked?.call(image);
        return;
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_file, color: Colors.grey),
            SizedBox(width: 10),
            Text("Add attachment", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class UploadOptions extends StatelessWidget {
  const UploadOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption(context, ImageSource.camera),
            SizedBox(width: 16),
            _buildOption(context, ImageSource.gallery),
          ],
        ),
        SizedBox(height: 26),
      ],
    );
  }

  Widget _buildOption(BuildContext context, ImageSource source) {
    return InkWell(
      onTap: () {
        context.pop(source);
      },
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              source == ImageSource.camera ? Icons.camera : Icons.image,
              color: Colors.purple,
              size: 32,
            ),
            SizedBox(height: 8),
            Text(
              source == ImageSource.camera ? "Camera" : "Image",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
