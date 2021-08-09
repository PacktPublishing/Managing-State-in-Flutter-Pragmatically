import 'package:flutter/material.dart';

import 'item.dart';

class MyCartInheritedWidget extends StatefulWidget {
  final Widget child;

  const MyCartInheritedWidget({Key? key, required this.child}) : super(key: key);

  static MyCartInheritedWidgetState of(BuildContext context) {
    final MyCartInheritedWidgetState? result = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.data;

    assert(result != null, 'No counter found in context');
    return result!;
  }

  @override
  State<StatefulWidget> createState() {
    return MyCartInheritedWidgetState();
  }
}

class MyCartInheritedWidgetState extends State<MyCartInheritedWidget> {
  List<Item> _items = populateItems();
  List<Item> _cart = [];

  List<Item> get items => _items;
  List<Item> get cart => _cart;

  void addToCart(Item item) {
    _cart.add(item);
    setState(() {});
  }

  void removeFromCart(Item item) {
    _cart.remove(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: widget.child,
      data: this,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final MyCartInheritedWidgetState data;

  MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => child != oldWidget;
}
