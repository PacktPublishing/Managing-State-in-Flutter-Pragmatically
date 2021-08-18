import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (context, snapshot) {
          if (snapshot is CartState)
            return Scaffold(
              appBar: AppBar(
                title: Text("Your cart (${snapshot.cart.length})"),
              ),
              body: ListView(
                children: snapshot.cart
                    .map(
                      (e) => ListTile(
                        title: Text(e.name ?? ''),
                        subtitle: Text("USD " + (e.price ?? '')),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(RemoveItemFromCartEvent(item: e));
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
