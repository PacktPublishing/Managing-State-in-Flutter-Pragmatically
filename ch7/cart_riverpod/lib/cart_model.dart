import 'package:cart_riverpod/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider((ref) => CartNotifier());

class CartNotifier extends StateNotifier<CartModel> {
  CartNotifier() : super(CartModel(cart: []));

//  void increment() => state = CartModel(count: state.count + 1);

  void addToCart(Item item) {
    var updatedCart = state.cart;
    updatedCart.add(item);
    state = CartModel(cart: updatedCart);
  }

  void removeFromCart(Item item) {
    var updatedCart = state.cart;
    updatedCart.remove(item);
    state = CartModel(cart: updatedCart);
  }

//  void removeFromCart(Item item) => state.cart.remove(item);
}

class CartModel {
  CartModel({required this.cart});

  List<Item> _items = populateItems();

  List<Item> get items => _items;

  List<Item> cart;
}
