import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_cubit.dart';
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
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    var items = BlocProvider.of<CartCubit>(context).items;
    return BlocBuilder(
        bloc: BlocProvider.of<CartCubit>(context),
        builder: (context, snapshot) {
          var cart = (snapshot as CartListState).cart;
          if (snapshot is CartListState)
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
                              BlocProvider.of<CartCubit>(context).addItemToCart(e);
                            else
                              BlocProvider.of<CartCubit>(context).removeItemFromCart(e);
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
