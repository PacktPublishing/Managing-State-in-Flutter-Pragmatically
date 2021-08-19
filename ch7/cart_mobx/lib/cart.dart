import 'package:mobx/mobx.dart';

import 'item.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  List<Item> items = populateItems();

  @observable
  List<Item> cart = [];

  @action
  void addItemToCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.add(item);
    cart = newCart;
  }

  @action
  removeItemFromCart(Item item) {
    var newCart = <Item>[];
    newCart.addAll(cart);
    newCart.remove(item);
    cart = newCart;
  }
}
