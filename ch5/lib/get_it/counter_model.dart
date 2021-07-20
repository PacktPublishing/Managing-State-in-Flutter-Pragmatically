import 'package:flutter/material.dart';

import 'get_it_example.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  CounterModel() {
    /// lets pretend we have to do some async initilization
    Future.delayed(Duration(milliseconds: 100)).then((_) => getIt.signalReady(this));
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
