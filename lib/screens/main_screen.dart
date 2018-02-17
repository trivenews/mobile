import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trive/routes.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/';

  /// Title for the AppBar.
  final String title = 'Trive';
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File imageFile;
  _MainScreenState();
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
                      onPressed: testButton,
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

  testButton() {
    Screens.push(context,
        screenName: Screen.ScreenShotPreviewScreen,
        params: {'file': imageFile});
  }
}
