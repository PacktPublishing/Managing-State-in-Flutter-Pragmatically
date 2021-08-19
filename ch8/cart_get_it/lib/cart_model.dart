import 'package:flutter/material.dart';

import 'item.dart';
import 'main.dart';

class CartModel extends ChangeNotifier {

  List<Item> items = populateItems();

  List<Item> cart = [];

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

  CartModel() {
    Future.delayed(Duration(milliseconds: 100)).then((_) => getIt.signalReady(this));
  }
}
