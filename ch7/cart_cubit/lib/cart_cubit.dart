import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(initialState);

  static get initialState => CartListState();

  List<Item> items = populateItems();
  List<Item> cart = [];

  int countValue = 0;

  addItemToCart(Item item) async {
    emit(CartUpdatingState());
    cart.add(item);
    emit(CartListState(cart: cart));
  }

  removeItemFromCart(Item item) async {
    emit(CartUpdatingState());
    cart.remove(item);
    emit(CartListState(cart: cart));
  }
}
