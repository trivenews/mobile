import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TriveImagePicker {
  Future<File> pickImage() async {
    return await ImagePicker.pickImage();
  }
}

