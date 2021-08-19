import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cart.dart';
import 'cart_page.dart';

final Cart cart = Cart();

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
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: cart.items
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text("USD " + (e.price ?? '')),
                  trailing: IconButton(
                    icon: Icon(
                      cart.cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                    ),
                    onPressed: () {
                      if (!cart.cart.contains(e))
                        cart.addItemToCart(e);
                      else
                        cart.removeItemFromCart(e);
                    },
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButton: cart.cart.isEmpty
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
                      child: Text(cart.cart.length.toString()),
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
