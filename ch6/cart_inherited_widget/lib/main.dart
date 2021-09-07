import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'inherited_widget_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCartInheritedWidget(
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
    var items = MyCartInheritedWidget.of(context).items;
    var cart = MyCartInheritedWidget.of(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: items // using items from within build method
            .map(
              (e) => ListTile(
                title: Text(e.name ?? ''),
                subtitle: Text("USD " + (e.price ?? '')),
                trailing: IconButton(
                  icon: Icon(
                    cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                  ),
                  onPressed: () {
                    // using cart variable to add/remove item
                    if (!cart.contains(e))
                      // replace existing code
                      MyCartInheritedWidget.of(context).addToCart(e);
                    else
                      // replace existing code
                      MyCartInheritedWidget.of(context).removeFromCart(e);
                    setState(() {});
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
                    // updated code
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
                    // using cart to show the number of items
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
