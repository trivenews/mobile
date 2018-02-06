import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trive/globals.dart';
import 'package:trive/routes.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/';
  final TriveImagePicker imagePicker;

  /// Depends on [TriveImagePicker]
  MainScreen([this.imagePicker]);

  /// Title for the AppBar.
  final String title = 'Trive';
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState();
  getImage() async {
    File fileName;
    if (widget.imagePicker != null) {
      fileName = await widget.imagePicker.pickImage();
    } else {
      fileName = await Globals.imagePicker.pickImage();
    }
    setState(() {
      Globals.selectedImageFile = fileName;
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
              child: Globals.selectedImageFile == null
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
    Screens.push(
      context,
      screenName: Screen.ScreenShotPreviewScreen,
    );
  }
}
