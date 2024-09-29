// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:hackyeah/widgets/activityPopup.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const title = 'Activities.';

    var mainAppState = context.watch<MainAppState>();


    return
        Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
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
        body: 
        Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/logo_clear.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
                BlendMode.dstATop,),),),
                child:
          GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(mainAppState.activities.length, (index) {
            return Center(
              child: 
              InkWell(
                borderRadius: BorderRadius.circular(25),
              onTap: () {
                showPopupCard(
                  context: context,
                  builder: (context) {
                    return (
                      activityCard(indexHandler: index)
                    );
                  },
                  alignment: Alignment.center,
                  useSafeArea: true,
                  dimBackground: true,
                );
              }, // Handle your callback
              child: Ink(height: 150, width: 150,
                decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
                color: Color.fromRGBO(79, 81, 140, 1),
              ),
                 child:Center(child:
                  Column(children:[ 
                  Icon(
                      mainAppState.activities[index]["icon"],
                      color: Theme.of(context).colorScheme.primary,
                      size: 80,
                    ),
                  Container(
                  child: Text(mainAppState.activities[index]["activity"], style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                  ),
                  ]),
                ),
              )
            ));
          }),
        ),
        )
    );
  }
}