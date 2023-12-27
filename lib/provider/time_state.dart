import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int _remainingTimeInSeconds = 30; // Defina o tempo inicial em segundos

  int get remainingTimeInSeconds => _remainingTimeInSeconds;

  void updateRemainingTime(int newTimeInSeconds) {
    _remainingTimeInSeconds = newTimeInSeconds;
    notifyListeners();
  }
}
