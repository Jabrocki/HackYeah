import 'package:flutter/material.dart';
import 'package:hackyeah/layouts/logInPage.dart';
import 'package:hackyeah/layouts/mainPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//AppState
import 'appState/mainAppState.dart';
//Layouts
import 'layouts/activityPage.dart';
import 'layouts/communityPage.dart';
import 'layouts/homePage.dart';
import 'layouts/workPage.dart';



void main() async{
  await dotenv.load(fileName: '.env');
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
        fontFamily: 'Now',             // <-- 1
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Now'),  // <-- 2
        primaryColor: const Color.fromRGBO(218, 191, 255, 255),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(127, 222, 255, 1),
          secondary: const Color.fromRGBO(144, 122, 214, 1),
          surface: const Color.fromRGBO(79, 81, 140, 1),
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
