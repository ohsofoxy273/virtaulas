import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppBar(
                title: Text('Virtaulas'), // Here is the app name "Virtaulas"
                centerTitle: true,
              ),
              Expanded(
                child: Container(), // Placeholder widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}