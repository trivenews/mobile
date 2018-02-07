import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TriveImagePicker {
  Future<File> pickImage() async {
    return await ImagePicker.pickImage();
  }
}

class Globals {
  static TriveImagePicker imagePicker = new TriveImagePicker();
  static File selectedImageFile;
}

/// Checks if runtimeType match for [value] and [variable],
/// if [allowNull] is `false` returns [value] if it's not null,
/// throws `ArgumentError.notNull` otherwise.
/// Specify [varName] for debugging.
dynamic GetVal(dynamic value, dynamic variable,
    {String varName, bool allowNull = false}) {
  if (value.runtimeType == variable.runtimeType) {
    if (!allowNull && (null == value)) {
      throw new ArgumentError.notNull('${varName ?? ''}');
    }
    return value;
  }
  throw new ArgumentError('${varName ?? ''} type mismatch');
}
