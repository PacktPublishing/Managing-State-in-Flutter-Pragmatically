import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;

  CounterState({this.count = 0});

  @override
  List<Object?> get props => [this.count];
}
