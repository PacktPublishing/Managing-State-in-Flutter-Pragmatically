import 'package:flutter/material.dart';
import 'inherited_model_counter.dart';

class InheritedModelHomePage extends StatefulWidget {
  @override
  _InheritedModelHomePageState createState() => _InheritedModelHomePageState();
}

class _InheritedModelHomePageState extends State<InheritedModelHomePage> {
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
      InheritedModel.inheritFrom<MyInheritedWidget>(context, aspect: 1)!
          .data
          .counterValue
          .toString(),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Button widget builds');
    return ElevatedButton(
      onPressed: () {
        InheritedModel.inheritFrom<MyInheritedWidget>(context, aspect: 2)!
            .data
            .incrementCounter();
      },
      child: Text('Add'),
    );
  }
}
