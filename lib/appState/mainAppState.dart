import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppState extends ChangeNotifier {
  int navBarIndex = 0;

  var activities = [
    "cycling",
    "skiing",
    "workout",
    "pushups",
    "running",
    "walking",
    "standing"
    ];

  void navBarTap(int index) {
    navBarIndex = index;
    notifyListeners();
  }
}