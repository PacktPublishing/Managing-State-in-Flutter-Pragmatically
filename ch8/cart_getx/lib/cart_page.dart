import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Your cart (${controller.cart.value.cart.length})"),
          ),
          body: ListView(
            children: controller.cart.value.cart
                .map(
                  (e) => ListTile(
                    title: Text(e.name ?? ''),
                    subtitle: Text("USD " + (e.price ?? '')),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        controller.removeItemFromCart(e);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }
    );
  }
}
