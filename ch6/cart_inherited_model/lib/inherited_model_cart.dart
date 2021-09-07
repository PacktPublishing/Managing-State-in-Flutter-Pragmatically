import 'package:flutter/material.dart';

import 'item.dart';

class MyCartInheritedModelWidget extends StatefulWidget {
  final Widget child;

  const MyCartInheritedModelWidget({Key? key, required this.child}) : super(key: key);

  static MyCartInheritedModelWidgetState of(BuildContext context) {
    final MyCartInheritedModelWidgetState? result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!.data;

    assert(result != null, 'No cart found in context');
    return result!;
  }

  @override
  State<StatefulWidget> createState() {
    return MyCartInheritedModelWidgetState();
  }
}

class MyCartInheritedModelWidgetState extends State<MyCartInheritedModelWidget> {
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

class MyInheritedWidget extends InheritedModel<List<Item>> {
  final MyCartInheritedModelWidgetState data;

  MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => child != oldWidget;

  @override
  bool updateShouldNotifyDependent(covariant InheritedModel<List<Item>> oldWidget, Set<List<Item>> dependencies) {
    if (dependencies.contains(1)) return true;
    return false;
  }
}
