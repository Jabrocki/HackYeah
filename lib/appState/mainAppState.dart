// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class MainAppState extends ChangeNotifier {
  int navBarIndex = 0;

  void navBarTap(int index) {
    navBarIndex = index;
    notifyListeners();
  }
  
  int _remainingTime = 25 * 60; // pełny licznik
  Timer? _timer; // Timer z biblioteki dart:async
  bool _isRunning = false; //sprawdzanie czy timer jest uruchomiony
  int _completedSessions = 0; // licznik sesji pomodoro

  int get remainingTime => _remainingTime;
  bool get isRunning => _isRunning;
  int get remainingMinutes => (_remainingTime / 60).floor();
  int get remainingSeconds => (_remainingTime % 60);
  int get completedSessions => _completedSessions;


  void startTimer() {
    // Logika odliczania czasu
    if (_isRunning) return;

    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners(); // powiadomienie o zmianie stanu
      } else {
        stopTimer(); // Po zakończeniu odliczania zatrzymuje Timer
      }
    });
  }


  void stopTimer() {
    // Logika zatrzymywania czasu
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

// zatrzymanie timera i ustawienie defaultowego stanu zegara
  void resetTimer() {
    stopTimer();
    _remainingTime = 25 * 60; 
    notifyListeners();
  }


  void completeSession() {
    _completedSessions += 1;
    notifyListeners();
  }
}

