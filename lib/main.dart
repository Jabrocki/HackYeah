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
        primaryColor: const Color.fromRGBO(218, 191, 255, 255),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 94, 54, 106),
          secondary: const Color.fromARGB(127, 222, 255, 255,),
          surface: const Color.fromARGB(218, 191, 255, 255),
        ),
        
      ),
      home: const AppPage(),
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
    ? const MainPage()
    : const LogInPage();
  }
}
