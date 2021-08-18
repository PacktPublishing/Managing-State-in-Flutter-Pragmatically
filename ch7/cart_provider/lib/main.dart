import 'package:cart_provider/cart_model.dart';
import 'package:cart_provider/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Cart>(
    child: MyApp(),
    create: (_) => Cart(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cart - Provider'),
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
    var items = context.watch<Cart>().items;
    var cart = context.watch<Cart>().cart;
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
                    if (!cart.contains(e))
                      context.read<Cart>().addToCart(e);
                    else
                      context.read<Cart>().removeFromCart(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: cart.isEmpty
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
                    child: Text(cart.length.toString()),
                  ),
                  SizedBox(width: 8),
                  Text('Cart'),
                ],
              ),
            ),
    );
  }
}
