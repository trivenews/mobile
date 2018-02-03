import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import 'screens/main_screen.dart';
import 'screens/screenshot_preview_screen.dart';

// final router = new Router();

// var screenshotHandler = new Handler(
//     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
//         new ScreenShotPreview(params['image']));

// /// Define app-wide routes
// void defineRoutes(Router router) {
//   router.define(ScreenShotPreview.routeName, handler: screenshotHandler);
// }

typedef Widget WidgetWithArgs([Map<String, dynamic> params]);

/// App routes
final Map<Screen, WidgetWithArgs> appRoutes = <Screen, WidgetWithArgs>{
  Screen.MainScreen: ([Map<String, dynamic> params]) => new MainScreen(params),
  Screen.ScreenShotPreviewScreen: ([Map<String, dynamic> params]) =>
      new ScreenShotPreview(params),
};

enum Screen { MainScreen, ScreenShotPreviewScreen }

class Screens {
  static void push(BuildContext context,
      {@required Screen screenName, Map<String, dynamic> params}) {
    Navigator
        .of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext context) {
      return appRoutes[screenName](params);
    }));
  }

  /// Only use this method when returning data to previous screen
  /// after poping. Such as on *Save* and *Confirmation* buttons.
  static dynamic pop(BuildContext context) {
    /// TODO: working on it.
    return Navigator.of(context).pop();
  }
}
