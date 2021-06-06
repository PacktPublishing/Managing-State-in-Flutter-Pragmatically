import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Increment, Decrement }

CounterState counterReducer(CounterState state, dynamic action) {
  if (action == Actions.Increment) {
    return CounterState(count: state.count + 1);
  }

  if (action == Actions.Decrement) {
    return CounterState(count: state.count - 1);
  }

  return state;
}

class CounterState {
  final int count;

  CounterState({this.count = 0});
}

final store = Store<CounterState>(counterReducer, initialState: CounterState());

void main() {
  runApp(
    StoreProvider<CounterState>(
      store: store,
      child: MyApp(),
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
            StoreConnector<CounterState, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(Actions.Increment),
        child: Icon(Icons.add),
      ),
    );
  }
}
