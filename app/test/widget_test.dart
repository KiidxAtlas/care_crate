// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:place/app.dart';

void main() {
  testWidgets('CareCrate app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: CareCrateApp()));

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome to CareCrate'), findsOneWidget);
    expect(find.text('Care packages made with love'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
