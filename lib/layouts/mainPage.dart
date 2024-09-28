import 'package:flutter/material.dart';
import 'package:hackyeah/appState/mainAppState.dart';
import 'package:hackyeah/layouts/activityPage.dart';
import 'package:hackyeah/layouts/communityPage.dart';
import 'package:hackyeah/layouts/homePage.dart';
import 'package:hackyeah/layouts/workPage.dart';
import 'package:provider/provider.dart';

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








