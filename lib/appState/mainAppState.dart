// ignore_for_file: unused_import, file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

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
      "activity": "Cycling",
      "unit": "kilometers",
      "icon": Icons.bike_scooter,
      "desc": "Cycling is an enjoyable way to stay healthy, including helping you lose weight, lower your cholesterol and strengthen your legs."
    },
    {
      "activity": "Skiing",
      "unit": "kilometers",
      "icon": Icons.landscape,
      "desc": "The very art of balancing and engaging the core and key muscle groups during skiing and snowboarding makes the body more flexible."
    },
    {
      "activity": "Workout",
      "unit": "hours",
      "icon": Icons.flag,
      "desc": "Regular physical activity can improve your muscle strength and boost your endurance."
    },
    {
      "activity": "Pushups",
      "unit": "times",
      "icon": Icons.arrow_upward,
      "desc": "Doing push ups every day is good for building upper body muscles and even strengthening your core, back, and lower extremities."
    },
    {
      "activity": "Running",
      "unit": "kilometers",
      "icon": Icons.directions_walk,
      "desc": "Cardiovascular exercise can create new brain cells and improve overall brain performance."
    },
    {
      "activity": "Walking",
      "unit": "kilometers",
      "icon": Icons.nordic_walking,
      "desc": "Walking is a great way to improve or maintain your overall health."
    }
  ];

  var loginAdmin = "Admin";
  var passwordAdmin = "Pass";

  //Update ilości lików w poście
  void mainLikeUpdate (int postIndex) {
    posts[postIndex]["likes"] = posts[postIndex]["likes"] + 1;
    notifyListeners();
  }

  // Lista ciał checkboxów
  List checkboxes = [
    {
      'index': 0,
      'state': false,
      'content': "Ergonomiczna postawa",
    },
    {
      'index': 1,
      'state': false,
      'content': "Prawidłowa odległość od monitora",
    },
    {
      'index': 2,
      'state': false,
      'content': "oświetlone otoczenie",
    },
  ];


  List states = [
    'Rest',
    'Work',
  ];


 
  int _currentState = 1;
  bool everyBoxChecked = false;
  int settedTime = 0;
  int _remainingTime = 0; // pełny licznik
  Timer? _timer; // Timer z biblioteki dart:async
  bool _isRunning = false; //sprawdzanie czy timer jest uruchomiony
  int _completedSessions = 0; // licznik sesji pomodoro
  int _activityPopupIndex = 0; // Required for popup expressions

  String get currentState => states[_currentState];
  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  int get remainingMinutes => (_remainingTime / 60).floor();
  int get remainingSeconds => (_remainingTime % 60);
  int get completedSessions => _completedSessions;


  bool isEveryBoxChecked() {
  return checkboxes.every((element) => element['state'] == true);
}

 // Zwraca stan checkboxa
  bool getCheckboxState(int index) {
    var checkbox = checkboxes.firstWhere((element) => element['index'] == index, orElse: () => null);
    return checkbox != null ? checkbox['state'] : false;
  }


  String getCheckboxContent(int number) {
  var checkbox = checkboxes.firstWhere((element) => element['index'] == number, orElse: () => null);
  if (checkbox != null) {
    return checkbox['content'];
  }
  return '';  // Return a default empty string
}

  // Zmienia stan checkboxa
  bool changeCheckboxState(int number) {
    var checkbox = checkboxes.firstWhere((element) => element['index'] == number, orElse: () => null);
    if (checkbox != null) {
      checkbox['state'] = !checkbox['state'];
    }
    return checkbox != null ? checkbox['state'] : false;
  }


  void setTimer(int seconds) {
    if (seconds < 0) {
      throw ArgumentError("Time must be non-negative.");
    }
    else if (_isRunning || !isEveryBoxChecked()) {
      return;
    }
    settedTime = seconds;
    _remainingTime = settedTime;
    notifyListeners();
  }

  void startSession() {
    // Logika odliczania czasu
    if (_isRunning || !isEveryBoxChecked() || remainingTime == 0 || _currentState == 0) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingTime > 0 && _currentState == 1) {
        _remainingTime--;
        notifyListeners(); // Notify listeners about the time update
      } else if (_remainingTime == 0 && _currentState == 1){
        //start break instruction
        _currentState = 0;
        _remainingTime = 5;
      } else if (_remainingTime > 0 && _currentState == 0) {
        _remainingTime--;
        notifyListeners();
      } else if (_remainingTime == 0 && _currentState == 0){
        _completedSessions++;
        _currentState = 1;
        stopTimer();
        notifyListeners();
      }

    });
  }


  void stopTimer() {
    // Logika zatrzymywania czasu
    if (_currentState == 0){
      return;
    }
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

// zatrzymanie timera i ustawienie defaultowego stanu zegara
  void resetTimer() {
    stopTimer();
    _remainingTime = settedTime; 
    notifyListeners();
  }


  void completeSession() {
    _completedSessions += 1;
    notifyListeners();
  }


  void resetSessions() {
  _completedSessions = 0;
  notifyListeners();
}


}


