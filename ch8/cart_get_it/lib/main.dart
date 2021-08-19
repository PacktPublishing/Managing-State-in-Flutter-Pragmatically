import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'cart_model.dart';
import 'cart_page.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CartModel>(CartModel(), signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    getIt.isReady<CartModel>().then((_) => getIt<CartModel>().addListener(update));
    // Alternative
    // getIt.getAsync<CounterModel>().addListener(update);

    super.initState();
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    var model = getIt<CartModel>();
    var cart = model.cart;
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: ListView(
              children: getIt<CartModel>()
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
                            model.addItemToCart(e);
                          else
                            model.removeItemFromCart(e);
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Waiting for initialisation'),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
