import 'package:flutter/material.dart';

class MainAppState extends ChangeNotifier {
  int navBarIndex = 0;

  var logIn = false;

  void navBarTap(int index) {
    navBarIndex = index;
    notifyListeners();
  }

  void logInTap(){
    logIn = true;
    notifyListeners();
  }

  List posts = [
    {
      "profileID": 1,
      "activityID": 0,
      "value": 100,
      "likes": 3
    },
    {
      "profileID": 0,
      "activityID": 2,
      "value": 275,
      "likes": 50
    }
  ];

  List profiles = [
    "Jabrooo",
    "Pajor",
    "Ridic"
  ];

  List activities = [
    {
      "activity": "cycling",
      "unit": "km"
    },
    {
      "activity": "skiing",
      "unit": "km"
    },
    {
      "activity": "workout",
      "unit": "h"
    },
    {
      "activity": "pushups",
      "unit": "times"
    },
    {
      "activity": "running",
      "unit": "km"
    },
    {
      "activity": "walking",
      "unit": "km"
    }
  ];

  void mainLikeUpdate (int postIndex) {
    posts[postIndex]["likes"] = posts[postIndex]["likes"] + 1;
    notifyListeners();
  }
}