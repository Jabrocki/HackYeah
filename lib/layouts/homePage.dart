// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:hackyeah/widgets/ridic_flexible.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();
    var title = "MonteCarlo";

    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title, style: TextStyle(
            fontFamily: 'Now',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Theme.of(context).colorScheme.primary,
                    )),
          ),
        ),
      body: const Flex(
            direction: Axis.vertical, // Horizontal layout
            crossAxisAlignment: CrossAxisAlignment
                .center, // Align children to the center along the cross axis
            children: [
              RidicFlexible(test: 5),
              RidicFlexible(test: 1),
              RidicFlexible(test: 1),
              RidicFlexible(test: 1),
            ],
          ),

    );
  }
}
