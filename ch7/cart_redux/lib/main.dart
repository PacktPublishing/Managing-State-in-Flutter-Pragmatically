import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'actions.dart';
import 'cart_page.dart';
import 'cart_state.dart';
import 'item.dart';

void main() {
  runApp(StoreProvider(
    child: MyApp(),
    store: store,
  ));
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
    return StoreConnector<CartState, List<Item>>(
        converter: (store) => store.state.cart,
        builder: (context, cart) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: ListView(
              children: items
                  .map(
                    (e) => ListTile(
                      title: Text(e.name ?? ''),
                      subtitle: Text("USD " + (e.price ?? '')),
                      trailing: IconButton(
                        icon: Icon(
                          cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                        ),
                        onPressed: () {
                          if (!cart.contains(e))
                            store.dispatch(AddItemToCartAction(item: e));
                          else
                            store.dispatch(RemoveItemFromCartAction(item: e));
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            floatingActionButton: cart.isEmpty
                ? null
                : FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                    label: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Text(cart.length.toString()),
                        ),
                        SizedBox(width: 8),
                        Text('Cart'),
                      ],
                    ),
                  ),
          );
          return Container();
        });
  }
}
