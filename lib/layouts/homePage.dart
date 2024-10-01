// ignore_for_file: unused_import, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hackyeah/widgets/ridic_flexible.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';
import '../notion/post.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    var mainAppState = context.watch<MainAppState>();
    var title = "MonteCarlo.";

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
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("img/logo_big.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
                BlendMode.dstATop,
        ),
              ),
            ),
            child:Flex(
            direction: Axis.vertical, // Horizontal layout
            crossAxisAlignment: CrossAxisAlignment
                .center, // Align children to the center along the cross axis
            children: [
              RidicFlexible(test: 1, iconBox: Icons.person, textH1: "Hello ${mainAppState.activeUserName}!", textH2: "Elevate your journey,", textH3: "MonteCarlo awaits.",),
              const RidicFlexible(test: 1, iconBox: Icons.bike_scooter, textH1: "25", textH2: "Kilometers cycled", textH3: " ",),
              const RidicFlexible(test: 1, iconBox: Icons.flag, textH1: "100", textH2: "Hours spent working out", textH3: " ",),
              const RidicFlexible(test: 1, iconBox: Icons.pool, textH1: "10", textH2: "Hours spent swimming", textH3: " ",),
              const RidicFlexible(test: 1, iconBox: Icons.person_4_rounded, textH1: "Rival: Jabroo", textH2: "Jabroo has 10km more", textH3: "in cycling",),
            ],
          ),
      )
    );
  }
}
