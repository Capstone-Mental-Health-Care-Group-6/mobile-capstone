import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownPaymentSuccessProvider extends ChangeNotifier {
  late DateTime _startTime;
  late Timer _timer;

  countDown() {
    _startTime = DateTime.now().add(const Duration(hours: 1));
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_startTime.difference(DateTime.now()).inSeconds <= 0) {
        timer.cancel();
      }
      notifyListeners();
    });
  }

  String get formattedStartTime => DateFormat('HH.mm').format(_startTime);

  String get formattedDate =>
      DateFormat('EEEE dd MMMM y', 'id').format(_startTime);

  Duration get timeLeft => _startTime.difference(DateTime.now());

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
