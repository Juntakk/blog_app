import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    if (xFile != null) {
      return File(xFile.path);
    }
  } catch (e) {
    return null;
  }
  return null;
}
