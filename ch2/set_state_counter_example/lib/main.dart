import 'package:flutter/material.dart';
import 'package:set_state_counter_example/my_stateful_widget.dart';
import 'package:set_state_counter_example/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _navigate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageTwo(
          counter: _counter,
          callback: (value) {
            setState(() {
              _counter = value;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ExampleStatefulPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
