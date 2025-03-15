import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keeper/core/theme/theme.dart';

Future<Uint8List?> pickImage(
  BuildContext context, {
  ImageSource? source,
}) async {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile = await picker.pickImage(
    source: source ?? ImageSource.gallery,
  );
  if (imageFile == null) return null;
  if (context.mounted) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 5, ratioY: 5),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColor.primaryColor,
          toolbarWidgetColor: AppColor.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.original,
          ],
        ),
        WebUiSettings(context: context),
      ],
    );
    return await croppedFile?.readAsBytes();
  }
  return null;
}
