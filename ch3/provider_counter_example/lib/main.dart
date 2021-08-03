import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_example/provider_counter.dart';

void main() {
  runApp(
    ChangeNotifierProvider<Counter>(
      child: MyApp(),
      create: (_) => Counter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderCounterExamplePage(),
    );
  }
}



