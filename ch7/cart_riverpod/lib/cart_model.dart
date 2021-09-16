import 'item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider((ref) => CartNotifier());

class CartNotifier extends StateNotifier<CartModel> {
  CartNotifier() : super(CartModel(cart: []));

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
}

class CartModel {
  CartModel({required this.cart});

  List<Item> _items = populateItems();

  List<Item> get items => _items;

  List<Item> cart;
}
