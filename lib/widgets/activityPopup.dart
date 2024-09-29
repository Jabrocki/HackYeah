// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import '../appState/mainAppState.dart';
import 'package:provider/provider.dart';
//notion
import 'package:hackyeah/notion/post.dart';

class activityCard extends StatelessWidget {
  final ActivityVar activity_test_var;
  final int indexHandler;
  const activityCard({
    required this.activity_test_var,
    required this.indexHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var icons_list = [
      Icons.bike_scooter,
      Icons.landscape,
      Icons.flag,
      Icons.arrow_upward,
      Icons.directions_walk,
      Icons.nordic_walking,
    ];

    return PopupCard(
    elevation: 8,
    child:Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
      color: const Color.fromRGBO(79, 81, 140, 0.8),
    ),
    child: Column(
                  children: [
                    Icon(
                      icons_list[activity_test_var.activityIcon],
                      color: Theme.of(context).colorScheme.primary,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity_test_var.activityName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(activity_test_var.desc,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),),
                          Row(
                            children: [
                              Padding(padding: const EdgeInsets.symmetric(vertical: 20.0), child:
                              SizedBox(
                                width: 175,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: activity_test_var.unit,
                                  ),
                                ),
                              ),
                              ),
                              Padding(padding: const EdgeInsets.all( 10.0), child:
                                InkWell(
                                onTap: () {
                                  print("koks");
                                }, // Handle your callback
                                child: Ink(height: 60, width: 100,
                                  child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
                                          color: Color.fromRGBO(79, 81, 140, 0.8),
                                        ),
                                    child: Center(child:Text("Add", style: TextStyle(
                                                color: Theme.of(context).colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),),)
                                    )
                                  ),
                                )
                              ),
                            ],
                          )
                          
                        ],
                      ),
                    )
                  ],
                ),
    )
    );
  }
}