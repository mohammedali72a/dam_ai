import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageDialog extends StatelessWidget {
  const PickImageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "اختار الصور",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: () async {
            List<File> images = await pickFromGallery();
            Navigator.of(context).pop(images);
          },
          style: ElevatedButton.styleFrom(
              // backgroundColor: ColorsManager.primaryColor,
              ),
          child: const Text(
            "الملفات",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            List<File> images = await pickFromCamera();
            Navigator.of(context).pop(images);
          },
          child: const Text(
            "الكاميرا",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

Future<List<File>> pickFromGallery() async {
  List<File> images = [];

  final pickedImages = await ImagePicker().pickMultiImage(
    imageQuality: 85,
    maxHeight: 1000,
    maxWidth: 1000,
  );

  if (pickedImages.isNotEmpty) {
    images.addAll(
      pickedImages.map(
        (pickedImage) => File(pickedImage.path),
      ),
    );
  }
  return images;
}

Future<List<File>> pickFromCamera() async {
  List<File> images = [];

  final pickedImage = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 85,
    maxHeight: 1000,
    maxWidth: 1000,
  );

  if (pickedImage != null) {
    images.add(
      File(pickedImage.path),
    );
  }
  return images;
}
