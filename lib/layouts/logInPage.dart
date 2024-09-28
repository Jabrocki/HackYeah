import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

    var login = "";
    var password = "";

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "img/logo_big.png",
                  width: 200, // szerokość w pikselach
                  height: 200, // wysokość w pikselach
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (String value) {
                      login = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (String value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (mainAppState.loginAdmin == login &&
                          mainAppState.passwordAdmin == password) {
                        mainAppState.logInTap();
                      }
                    },
                    child: Text("Login"))
              ]),
        ),
      ),
    );
  }
}
