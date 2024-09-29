// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import '../appState/mainAppState.dart';
import 'package:provider/provider.dart';

class activityCard extends StatelessWidget {
  final int indexHandler;
  const activityCard({
    required this.indexHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainAppState = context.watch<MainAppState>();

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
                      mainAppState.activities[indexHandler]["icon"],
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
                            mainAppState.activities[indexHandler]["activity"],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(mainAppState.activities[indexHandler]["desc"],
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
                                    labelText: mainAppState.activities[indexHandler]["unit"],
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