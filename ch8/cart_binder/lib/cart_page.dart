import 'package:cart_binder/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:binder/binder.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch(cartRef).cart;
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
              icon: const Icon(Icons.remove_circle),
              onPressed: () {
                context.use(cartViewLogicRef).removeFromCart(e);
              },
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
