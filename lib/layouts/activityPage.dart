// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const title = 'Activities';

    var mainAppState = context.watch<MainAppState>();


    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(mainAppState.activities.length, (index) {
            return Center(
              child: 
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(mainAppState.activities[index]),
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              //     shape: StadiumBorder(),
              //   ),
              // ),
              InkWell(
              onTap: () {}, // Handle your callback
              child: Ink(height: 100, width: 100, child:Container(
                  child: Text(mainAppState.activities[index]["activity"]),
                  )
                ),
              )
            );
          }),
        ),
      ),
    );
  }
}