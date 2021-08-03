import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(CounterModel(count: 0));

  void increment() => state = CounterModel(count: state.count + 1);
}

class CounterModel {
  int count;

  CounterModel({required this.count});
}

class RiverpodCustomCounterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod custom counter example')),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            final state = watch(counterProvider) as CounterModel;
            return Text('${state.count}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
