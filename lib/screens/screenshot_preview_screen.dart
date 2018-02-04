import 'package:flutter/material.dart';
import 'dart:io';

class ScreenShotPreview extends StatefulWidget {
  static const String routeName = '/screenshots/preview';
  final File file;
  ScreenShotPreview([Map<String, dynamic> params = const {}])
      : file = params['file']?.runtimeType == File ? params['file'] : null;

  @override
  ScreenShotPreviewState createState() => new ScreenShotPreviewState(file);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ScreenShotPreviewState extends State<ScreenShotPreview> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new Key('ScreenShotsPreview');
  final double _appBarHeight = 256.0;
  File file;
  ScreenShotPreviewState(this.file);

  Widget showImage() {
    if (file == null) {
      return new Text('No image file');
    }
    return new Image.file(file);
  }

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating ||
                _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            actions: <Widget>[
              new PopupMenuButton<AppBarBehavior>(
                onSelected: (AppBarBehavior value) {
                  setState(() {
                    _appBarBehavior = value;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuItem<AppBarBehavior>>[
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.normal,
                          child: const Text('App bar scrolls away')),
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.pinned,
                          child: const Text('App bar stays put')),
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.floating,
                          child: const Text('App bar floats')),
                      const PopupMenuItem<AppBarBehavior>(
                          value: AppBarBehavior.snapping,
                          child: const Text('App bar snaps')),
                    ],
              )
            ],
            flexibleSpace: new FlexibleSpaceBar(
              title: const Text('Selected Image'),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  showImage(),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x60000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              new Column(
                children: <Widget>[
                  new TextField(
                    maxLines: 5,
                    decoration:
                        new InputDecoration(hintText: 'Multi line input box'),
                  ),
                  new ExpansionTile(
                    title: new Text('DropDown'),
                    children: <Widget>[
                      new FlatButton(
                        child: new Text('One'),
                        onPressed: null,
                      ),
                      new FlatButton(
                        child: new Text('two'),
                        onPressed: null,
                      ),
                      new FlatButton(
                        child: new Text('three'),
                        onPressed: null,
                      ),
                      new FlatButton(
                        child: new Text('four'),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  void dropDownSelect() {}
}
