import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';
import 'cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cart - GetX'),
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
    Get.put(CartController());
    return GetBuilder(builder: (CartController controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: controller.cart.value.items
              .map(
                (e) => ListTile(
                  title: Text(e.name ?? ''),
                  subtitle: Text("USD " + (e.price ?? '')),
                  trailing: IconButton(
                    icon: Icon(
                      controller.cart.value.cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                    ),
                    onPressed: () {
                      if (!controller.cart.value.cart.contains(e))
                        controller.addItemToCart(e);
                      else
                        controller.removeItemFromCart(e);
                    },
                  ),
                ),
              )
              .toList(),
        ),
        floatingActionButton: controller.cart.value.cart.isEmpty
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
                      child: Text(controller.cart.value.cart.length.toString()),
                    ),
                    SizedBox(width: 8),
                    Text('Cart'),
                  ],
                ),
              ),
      );
    });
  }
}
