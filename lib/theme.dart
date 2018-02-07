import 'package:flutter/material.dart';

class TriveTheme {
  static final ThemeData _data = new ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      accentColor: Colors.orangeAccent[700]);
  static ThemeData get dark => _data;
}
