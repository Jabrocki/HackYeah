// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class PajorAppState extends ChangeNotifier {
  int _remainingTime = 25 * 60; // pełny licznik
  int _completedSessions = 0; // licznik sesji pomodoro

  int get remainingTime => _remainingTime;
  int get completedSessions => _completedSessions;

  void startTimer() {
    // Logika odliczania czasu
    notifyListeners();
  }

  void resetTimer() {
    _remainingTime = 25 * 60;
    notifyListeners();
  }

  void completeSession() {
    _completedSessions += 1;
    notifyListeners();
  }
}