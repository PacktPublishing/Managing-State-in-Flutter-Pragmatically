import 'package:flutter/material.dart';

import 'item.dart';
import 'main.dart';

// One
class CartModel extends ChangeNotifier {

  // Two
  List<Item> items = populateItems();

  List<Item> cart = [];

  // Three
  void addItemToCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.add(item);
    cart = newCart;
    notifyListeners();
  }

  removeItemFromCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.remove(item);
    cart = newCart;
    notifyListeners();
  }

  // Four
  CartModel() {
    Future.delayed(Duration(milliseconds: 100)).then((_) => getIt.signalReady(this));
  }
}
