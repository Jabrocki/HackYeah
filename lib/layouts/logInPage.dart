// ignore_for_file: no_leading_underscores_for_local_identifiers

//import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';
import 'package:crypto/crypto.dart';

import '../notion/notion_repository.dart';
import '../notion/post.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({
    super.key,
  });

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var login = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

    Future<void> test() async {
      List<User> _futureUsers = await ProfileRepository().getItems();
      for (final _profile in _futureUsers) {
        if ((_profile.userName == login) && (_profile.password == password)) {
          mainAppState.logInTap();
          mainAppState.activeUserName = login;
        }
      }
    }

    
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
                      var passInBytes = utf8.encode(value);
                      password = sha256.convert(passInBytes).toString();
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
                      test();
                    },
                    child: const Text("Login"))
              ]),
        ),
      ),
    );
  }
}
