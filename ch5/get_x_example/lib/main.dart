import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Counter {
  int count;

  Counter({required this.count});
}

class CounterController extends GetxController {
  var counter = (Counter(count: 0)).obs;

  void increment() {
    counter.value.count++;
    update();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder(
              builder: (CounterController controller) {
                return Text(
                  controller.counter.value.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
