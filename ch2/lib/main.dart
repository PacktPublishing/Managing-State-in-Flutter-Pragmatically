import 'package:flutter/material.dart';
import 'inherited_model/home_page_inherited_model.dart';
import 'inherited_widget/home_page_inherited_widget.dart';
import 'set_state/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageMaster(),
    );
  }
}

class HomePageMaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter One'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: 'setState'),
                  ),
                );
              },
              child: Text('setState'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InheritedWidgetHomePage(),
                  ),
                );
              },
              child: Text('Inherited Widget'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InheritedModelHomePage(),
                  ),
                );
              },
              child: Text('Inherited Model'),
            ),
          ],
        ),
      ),
    );
  }
}
