import 'package:flutter/material.dart';

import 'inherited_widget_counter.dart';

class InheritedWidgetHomePage extends StatefulWidget {
  @override
  _InheritedWidgetHomePageState createState() => _InheritedWidgetHomePageState();
}

class _InheritedWidgetHomePageState extends State<InheritedWidgetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: MyCounterInheritedWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Counter value:'),
              MyTextWidget(),
              MyButton(),
            ],
          ),
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
