import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_cubit.dart';
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
        bloc: BlocProvider.of<CartCubit>(context),
        builder: (context, snapshot) {
          if (snapshot is CartListState)
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
                            BlocProvider.of<CartCubit>(context).removeItemFromCart(e);
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
