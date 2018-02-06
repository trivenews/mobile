import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trive/screens/screenshot_preview_screen.dart';

import 'mocks/image_picker.dart';

void main() {
  testWidgets('ScreenShotScreen:', (WidgetTester tester) async {
    /// Build our [ScreenShotPreviewScreen] wihtout an image.
    await tester.pumpWidget(new MaterialApp(home: new ScreenShotPreview()));

    expect(find.text('No image file'), findsOneWidget,
        reason: 'shows status text before image select');
    expect(find.byType(Image), findsNothing,
        reason: 'hides ImageWidget before image seelct');

    /// Build our [ScreenShotPreviewScreen] with an image.
    File testImage = await new ImagePickerMock().pickImage();
    await tester
        .pumpWidget(new MaterialApp(home: new ScreenShotPreview(testImage)));

    expect(find.text('No image file'), findsNothing,
        reason: 'hides status text after image select');
    expect(find.byType(Image), findsOneWidget,
        reason: 'shows ImageWidget after image seelct');
  });
}
