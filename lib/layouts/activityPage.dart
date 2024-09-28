import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appState/mainAppState.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const title = 'Activities';

    var mainAppState = context.watch<MainAppState>();


    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(title, style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        )),
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
                borderRadius: BorderRadius.circular(25),
              onTap: () {
                showPopupCard(
                  context: context,
                  builder: (context) {
                    return PopupCard(
                      elevation: 8,
                      color: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(50),
                        child: Text('This is a popup card'),
                      ),
                    );
                  },
                  alignment: Alignment.center,
                  useSafeArea: true,
                  dimBackground: true,
                );
              }, // Handle your callback
              child: Ink(height: 150, width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25),
                  ),
                 child:Center(child: Container(
                  child: Text(mainAppState.activities[index]["activity"]),
                  ))
                ),
              )
            );
          }),
        ),
    );
  }
}