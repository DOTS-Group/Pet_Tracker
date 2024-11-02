import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomepageController {
  double progressCalculator(dynamic value) {
    // Walking Time Progress Calculation (45 min = %100, 0 min = %0)
    if (value is int) {
      if (value <= 0) {
        return 0;
      } else if (value >= 45) {
        return 100;
      } else {
        return value / 45;
      }
    }
    // Vaccine Time Progress Calculation (30 days = %0, 0 days = %100)
    else if (value is String) {
      DateTime now = DateTime.now();
      DateFormat dateFormat = DateFormat("d.M.yyyy");
      DateTime valueDate = dateFormat.parse(value);
      int difference = valueDate.difference(now).inDays;
      if (difference <= 0) {
        return 1;
      } else if (difference >= 30) {
        return 0;
      } else {
        return 1 - (difference / 30);
      }
    } else {
      throw ArgumentError("value tipi int veya String olmalı");
    }
  }

}

// A StateNotifier to handle the timer logic
class TimerNotifier extends StateNotifier<String> {
  TimerNotifier() : super("00:00");
  Timer? _timer;
  int _elapsedSeconds = 0;

  void startTimer() {
    // Start the timer if not already running
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedSeconds++;
        int minutes = _elapsedSeconds ~/ 60;
        int seconds = _elapsedSeconds % 60;
        state = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _elapsedSeconds = 0;
    state = "00:00"; // Reset to initial state
  }

  void toggleTimer() {
    if (_timer == null || !_timer!.isActive) {
      startTimer();
    } else {
      stopTimer();
    }
  }
}

// Create a provider for the TimerNotifier
final timerProvider = StateNotifierProvider<TimerNotifier, String>((ref) {
  return TimerNotifier();
});

