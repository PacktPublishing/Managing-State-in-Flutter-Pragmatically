import 'package:cart_bloc/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc {
  CartBloc() : super(initialState);

  static get initialState => CartState();

  List<Item> items = populateItems();
  List<Item> cart = [];

  @override
  Stream mapEventToState(event) async* {
    yield CartUpdatingState();
    if (event is AddItemToCartEvent) {
      cart.add(event.item);
      yield CartState(cart: cart);
    }
    if (event is RemoveItemFromCartEvent) {
      cart.remove(event.item);
      yield CartState(cart: cart);
    }
  }
}
