import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_bloc.dart';
import 'cart_event.dart';
import 'cart_page.dart';
import 'cart_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Cart - Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var items = BlocProvider.of<CartBloc>(context).items;
    return BlocBuilder(
        bloc: BlocProvider.of<CartBloc>(context),
        builder: (context, snapshot) {
          var cart = (snapshot as CartState).cart;
          if (snapshot is CartState)
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: ListView(
                children: items
                    .map(
                      (e) => ListTile(
                        title: Text(e.name ?? ''),
                        subtitle: Text("USD " + (e.price ?? '')),
                        trailing: IconButton(
                          icon: Icon(
                            cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                          ),
                          onPressed: () {
                            if (!snapshot.cart.contains(e))
                              BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(item: e));
                            else
                              BlocProvider.of<CartBloc>(context).add(RemoveItemFromCartEvent(item: e));
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
              floatingActionButton: snapshot.cart.isEmpty
                  ? null
                  : FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      label: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(snapshot.cart.length.toString()),
                          ),
                          SizedBox(width: 8),
                          Text('Cart'),
                        ],
                      ),
                    ),
            );
          return Container();
        });
  }
}
