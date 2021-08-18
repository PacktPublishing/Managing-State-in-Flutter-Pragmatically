import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'item.dart';

class CartState extends Equatable {
  final List<Item> cart;

  CartState({this.cart = const []});

  @override
  List<Object?> get props => [this.cart];
}

CartState cartReducer(CartState state, dynamic action) {
  if (action is AddItemToCartAction) {
    var updatedCart = <Item>[];
    updatedCart.addAll(state.cart);
    updatedCart.add(action.item);
    return CartState(cart: updatedCart);
  }

  if (action is RemoveItemFromCartAction) {
    var updatedCart = <Item>[];
    updatedCart.addAll(state.cart);
    updatedCart.remove(action.item);
    return CartState(cart: updatedCart);
  }

  return state;
}

final store = Store<CartState>(cartReducer, initialState: CartState());

final items = populateItems();
