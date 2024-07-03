import 'package:flutter/material.dart';

class McqProvider extends ChangeNotifier {
  int trueCount = 0;
  int falseCount = 0;

  int get getTrueCount => trueCount;

  int get getFalseCount => falseCount;

  void addTrueCount() {
    trueCount++;
    notifyListeners();
  }

  void addFalseCount() {
    falseCount++;
    notifyListeners();
  }
}
