import 'package:ch6/cart_inherited_widget/inherited_widget_cart.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCartInheritedWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        children: MyCartInheritedWidget.of(context)
            .items
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
                      MyCartInheritedWidget.of(context).addToCart(e);
                    else
                      MyCartInheritedWidget.of(context).removeFromCart(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: items.isEmpty
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
