import 'package:flutter/material.dart';
import 'package:hackyeah/layouts/logInPage.dart';
import 'package:hackyeah/layouts/mainPage.dart';
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
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 165, 5, 240)),
        ),
        home: AppPage(),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
  });



  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();

    return mainAppState.logIn
    ? MainPage()
    : LogInPage();
  }
}
