import 'package:binder/binder.dart';
import 'package:flutter/material.dart';

import 'cart_model.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Cart - Binder'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final myCartRef = context.watch(cartRef);
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
                    myCartRef.cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                  ),
                  onPressed: () {
                    if (!myCartRef.cart.contains(e)) {
                      context.use(cartViewLogicRef).addToCart(e);
                    } else {
                      context.use(cartViewLogicRef).removeFromCart(e);
                    }
                  },
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: myCartRef.cart.isEmpty
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(myCartRef.cart.length.toString()),
                  ),
                  const SizedBox(width: 8),
                  const Text('Cart'),
                ],
              ),
            ),
    );
  }
}
