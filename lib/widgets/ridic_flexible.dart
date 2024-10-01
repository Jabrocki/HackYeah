// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';


class RidicFlexible extends StatelessWidget {
  final int test;
  final IconData iconBox;
  final String textH1;
  final String textH2;
  final String textH3;
  const RidicFlexible({
    super.key,
    required this.test,
    required this.iconBox,
    required this.textH1,
    required this.textH2,
    required this.textH3,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
                flex: test,
                child:
              Container(
                padding: EdgeInsets.all(16),
                // Stylizacja
                decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 4.0),
                color: Color.fromRGBO(79, 81, 140, 0.8),
              ),
                margin:  EdgeInsets.only(top: 30.0,left: 30, right: 30),
                child: Row(
                  children: [
                    Icon(
                      iconBox,
                      color: Theme.of(context).colorScheme.primary,
                      size: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textH1,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(textH2,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),),
                          Text(textH3,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              );
  }
}