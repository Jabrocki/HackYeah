import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppState extends ChangeNotifier {
  int navBarIndex = 0;

  void navBarTap(int index) {
    navBarIndex = index;
    notifyListeners();
  }
}