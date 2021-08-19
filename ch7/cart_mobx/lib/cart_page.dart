import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'main.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Your cart (${cart.cart.length})"),
        ),
        body: ListView(
          children: cart.cart
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text("USD " + (e.price ?? '')),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      cart.removeItemFromCart(e);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      );
      return Container();
    });
  }
}
