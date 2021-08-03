import 'package:flutter/material.dart';

class ExampleStatefulPage extends StatefulWidget {
  @override
  _ExampleStatefulPageState createState() => _ExampleStatefulPageState();
}

class _ExampleStatefulPageState extends State<ExampleStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('Child Widget builds');
    return Container();
  }
}
