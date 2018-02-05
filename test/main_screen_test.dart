import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trive/screens/main_screen.dart';
import 'mocks/image_picker.dart';

void main() {
  testWidgets('MainScreen:', (WidgetTester tester) async {
    /// Build our [MainScreen] and trigger a frame.
    await tester.pumpWidget(
        new MaterialApp(home: new MainScreen(new ImagePickerMock())));

    expect(find.text('No image selected.'), findsOneWidget,
        reason: 'shows status text before image select');
    expect(find.text('Proceed'), findsNothing,
        reason: 'hides proceed before image seelct');

    /// Tap on the add floating action button.
    await tester.tap(find.byIcon(Icons.add_a_photo));
    await tester.pump();

    expect(find.text('Proceed'), findsOneWidget,
        reason: 'shows proceed after image select');
    expect(find.text('No image selected.'), findsNothing,
        reason: 'hides status text after image select');
  });
}
