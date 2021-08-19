import 'package:cart_riverpod/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final state = watch(cartProvider) as CartModel;
      var cart = state.cart;
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
                      context.read(cartProvider.notifier).removeFromCart(e);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
