import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lang_learning/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Header contains "Virtaulas"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final headerFinder = find.byType(AppBar);
    expect(headerFinder, findsOneWidget);
    final virtaulasFinder = find.text('Virtaulas');
    expect(virtaulasFinder, findsOneWidget);
  });

  testWidgets('Bottom nav bar contains home and settings options',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => BottomNavBarProvider(),
      child: MyApp(),
    ));
    final bottomNavBarFinder = find.byType(BottomNavigationBar);
    expect(bottomNavBarFinder, findsOneWidget);
    final homeOptionFinder = find.text('Home');
    expect(homeOptionFinder, findsOneWidget);
    final settingsOptionFinder = find.text('Settings');
    expect(settingsOptionFinder, findsOneWidget);
  });
}
