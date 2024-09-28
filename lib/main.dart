import 'package:flutter/material.dart';
import 'appState/mainAppState.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  static const List<Widget> _pageOptions = <Widget>[
    Text("HomePage"),
    Text("ProfilePage"),
    Text("TestPage"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(MainAppState().navBarIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: MainAppState().navBarIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: MainAppState.navBarTap,
      ),
    );
  }
}
