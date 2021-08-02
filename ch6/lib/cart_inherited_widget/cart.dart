import 'package:flutter/material.dart';

import 'inherited_widget_cart.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = MyCartInheritedWidget.of(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart (${cart.length})"),
      ),
      body: ListView(
        children: cart
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text("USD " + (e.price ?? '')),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    MyCartInheritedWidget.of(context).removeFromCart(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
