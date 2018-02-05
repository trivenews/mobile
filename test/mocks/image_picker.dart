import 'dart:async';
import 'dart:io';

import 'package:trive/globals.dart';

class ImagePickerMock implements TriveImagePicker {
  Future<File> pickImage() {
    return new Future.value(new File("/test/file"));
  }
}
