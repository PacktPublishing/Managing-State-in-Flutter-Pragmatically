import 'package:flutter/material.dart';

import 'cart_model.dart';
import 'main.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    getIt.isReady<CartModel>().then((_) => getIt<CartModel>().addListener(update));
    // Alternative
    // getIt.getAsync<CounterModel>().addListener(update);

    super.initState();
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    var model = getIt<CartModel>();
    var cart = model.cart;
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
                    model.removeItemFromCart(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
