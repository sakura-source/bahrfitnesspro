import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/progress_photos_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ProgressPhotosScreen', () {
    testWidgets('should display the title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProgressPhotosScreen()));
      expect(find.text('Progress Photos'), findsOneWidget);
    });

    testWidgets('should upload and display a new photo', (WidgetTester tester) async {
      final picker = ImagePicker();
      final XFile image = XFile('test/test_resources/test_image.jpg');
      await tester.pumpWidget(MaterialApp(home: ProgressPhotosScreen()));

      // Simulate picking an image
      await tester.tap(find.text('Upload New Photo'));
      await tester.pumpAndSettle();

      // Verify the image is displayed
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
