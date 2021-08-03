import 'package:flutter/material.dart';

import 'inherited_widget_counter.dart';

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
      home: MyCounterInheritedWidget(child: MyHomePage(title: 'Flutter Demo Home Page')),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter value:'),
            MyTextWidget(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Text widget builds');
    return Text(
      MyCounterInheritedWidget.of(context).counterValue.toString(),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Button widget builds');
    return ElevatedButton(
      onPressed: () {
        MyCounterInheritedWidget.of(context).incrementCounter();
      },
      child: Text('Add'),
    );
  }
}
