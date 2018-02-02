import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:fluro/fluro.dart';
import 'screenshot_preview_screen.dart';

File imageFile;
void main() {
  /// App routes
  final Map<String, WidgetBuilder> appRoutes = <String, WidgetBuilder>{
    MainScreen.routeName: (BuildContext context) => new MainScreen(
          key: new GlobalKey<ScaffoldState>(debugLabel: 'MainScreen'),
          title: 'Trive',
        ),
    ScreenShotPreview.routeName: (BuildContext context) =>
        new ScreenShotPreview(imageFile),
  };

  // final router  = new Router();
  runApp(new MaterialApp(
    theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        accentColor: Colors.orangeAccent[700]),
    routes: appRoutes,

    /// App title, this is different from a screen title.
    title: "Trive",
    debugShowCheckedModeBanner: false,
  ));
}

class MainScreen extends StatefulWidget {
  static String routeName = '/';
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  getImage() async {
    var _fileName = await ImagePicker.pickImage();
    setState(() {
      imageFile = _fileName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: imageFile == null
                  ? new Text('No image selected.')
                  : new FlatButton(
                      child: new Text('Proceed'),
                      onPressed: textF,
                      color: Colors.green,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  textF() {
    Navigator.pushNamed(context, '/screenshots/preview');
  }
}
