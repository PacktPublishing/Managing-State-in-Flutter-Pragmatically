import 'package:binder/binder.dart';
import 'item.dart';

List<Item> items = populateItems();

class CartModel {
  List<Item> cart;

  CartModel({required this.cart});
}

final cartRef = StateRef(CartModel(cart: []));

final cartViewLogicRef = LogicRef((scope) => CartViewLogic(scope));

class CartViewLogic with Logic {
  const CartViewLogic(this.scope);

  @override
  final Scope scope;

  void addToCart(Item item) {
    read(cartRef).cart.add(item);
    var updatedCart = CartModel(cart: read(cartRef).cart);
    write(cartRef, updatedCart);
  }

  void removeFromCart(Item item) {
    read(cartRef).cart.remove(item);
    var updatedCart = CartModel(cart: read(cartRef).cart);
    write(cartRef, updatedCart);
  }
}
