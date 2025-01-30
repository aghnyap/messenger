// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/di/di.dart';
import 'package:example/src/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() async {
    configureDependencies(); // ✅ Register fresh dependencies for every test
  });

  tearDown(() async {
    await getIt.reset(); // ✅ Ensure cleanup after each test
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ✅ Ensure the counter starts at 0
    expect(find.text('0'), findsExactly(2));
    expect(find.text('1'), findsNothing);

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // ✅ Wait for UI to update

    // ✅ Ensure the counter has incremented
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ✅ Ensure the counter starts at 0
    expect(find.text('0'), findsExactly(2));
    expect(find.text('-1'), findsNothing);

    // Tap the '-' button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump(); // ✅ Wait for UI to update

    // ✅ Ensure the counter has decremented
    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsOneWidget);
  });
}
