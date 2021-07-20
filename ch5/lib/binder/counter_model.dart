import 'package:binder/binder.dart';

class CounterModel {
  int count;

  CounterModel({required this.count});
}

final counterRef = StateRef(CounterModel(count: 0));

final counterViewLogicRef = LogicRef((scope) => CounterViewLogic(scope));

class CounterViewLogic with Logic {
  const CounterViewLogic(this.scope);

  @override
  final Scope scope;

  void increment() {
    var counter = CounterModel(count: ++read(counterRef).count);
    write(counterRef, counter);
  }
}