import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'actions.dart';
import 'cart_state.dart';
import 'item.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CartState, List<Item>>(
        converter: (store) => store.state.cart,
        builder: (context, cart) {
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
                          store.dispatch(RemoveItemFromCartAction(item: e));
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
