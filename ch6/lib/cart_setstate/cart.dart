import 'package:flutter/material.dart';

import '../item.dart';

class CartPage extends StatefulWidget {
  final List<Item> cart;
  final Function(List<Item>) onCartUpdated;

  CartPage({required this.cart, required this.onCartUpdated});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart (${widget.cart.length})"),
      ),
      body: ListView(
        children: widget.cart
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text("USD " + (e.price ?? '')),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    widget.cart.remove(e);
                    setState(() {});
                    widget.onCartUpdated(widget.cart);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
