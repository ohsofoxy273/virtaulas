import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BottomNavBarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<BottomNavBarProvider>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: Text(provider.title),
            centerTitle: true,
          ),
          body: provider.currentIndex == 0 ? HomePage() : SettingsPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.currentIndex = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  String _nativeLanguage = 'English';
  String _learningLanguage = 'Spanish';

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
  ];

  List<Widget> get pages => _pages;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  String get title => _currentIndex == 0 ? 'Home' : 'Settings';

  String get nativeLanguage => _nativeLanguage;

  set nativeLanguage(String language) {
    _nativeLanguage = language;
    notifyListeners();
  }

  String get learningLanguage => _learningLanguage;

  set learningLanguage(String language) {
    _learningLanguage = language;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('My native language',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: Provider.of<BottomNavBarProvider>(context)
                            .nativeLanguage,
                        onChanged: (newValue) {
                          Provider.of<BottomNavBarProvider>(context,
                                  listen: false)
                              .nativeLanguage = newValue!;
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: 'Spanish',
                            child: Text('Spanish'),
                          ),
                          DropdownMenuItem(
                            value: 'European Portuguese',
                            child: Text('European Portuguese'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('My learning language',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: Provider.of<BottomNavBarProvider>(context)
                            .learningLanguage,
                        onChanged: (newValue) {
                          Provider.of<BottomNavBarProvider>(context,
                                  listen: false)
                              .learningLanguage = newValue!;
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'English',
                            child: Text('English'),
                          ),
                          DropdownMenuItem(
                            value: 'Spanish',
                            child: Text('Spanish'),
                          ),
                          DropdownMenuItem(
                            value: 'European Portuguese',
                            child: Text('European Portuguese'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
