import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lang_learning/main.dart';

void main() {
  testWidgets('Header contains "Virtaulas"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final headerFinder = find.byType(AppBar);
    expect(headerFinder, findsOneWidget);
    final virtaulasFinder = find.text('Virtaulas');
    expect(virtaulasFinder, findsOneWidget);
  });
}
