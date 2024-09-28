import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//AppState
import 'appState/mainAppState.dart';
//Layouts
import 'layouts/activityPage.dart';
import 'layouts/communityPage.dart';
import 'layouts/homePage.dart';
import 'layouts/workPage.dart';



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
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 94, 54, 106),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 94, 54, 106),
          secondary: const Color.fromARGB(255, 12, 202, 152),
          surface: const Color.fromARGB(255, 51, 25, 64),
        ),
        ),
    home: const MainPage(),
    ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  static const List<Widget> _pageOptions = <Widget>[
    HomePage(),
    ActivityPage(),
    WorkPage(),
    CommunityPage(),
  ];

  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();

    return Scaffold(
      
      body: Center(
        child: _pageOptions.elementAt(mainAppState.navBarIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kayaking),
            label: 'Aktywność',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Community',
          ),
        ],
        currentIndex: mainAppState.navBarIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: mainAppState.navBarTap,
      ),
    );
  }
}








