import 'package:ch2/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc {
  CounterBloc() : super(initialState);

  static get initialState => CounterState();

  int countValue = 0;

  @override
  Stream mapEventToState(event) async* {
    if(event is IncrementCounterEvent) {
      yield CounterState(count: ++countValue);
    }
    if(event is AddToCounterEvent) {
      countValue = countValue + event.number;
      yield CounterState(count: countValue);
    }
  }
}