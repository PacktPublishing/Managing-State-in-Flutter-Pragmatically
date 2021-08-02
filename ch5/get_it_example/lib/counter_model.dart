import 'package:flutter/material.dart';

import 'main.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  CounterModel() {
    Future.delayed(Duration(milliseconds: 100)).then((_) => getIt.signalReady(this));
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
