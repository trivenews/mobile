import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(new TriveApp());
}

class TriveApp extends StatefulWidget {
  @override
  _TriveAppState createState() => new _TriveAppState();
}

class _TriveAppState extends State<TriveApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: TriveTheme.dark,
      home: appRoutes[Screen.MainScreen](),

      /// App title, this is different from a screen title.
      title: "Trive",
      debugShowCheckedModeBanner: false,
    );
  }
}
