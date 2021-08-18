import 'package:equatable/equatable.dart';

import 'item.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartListState extends CartState {
  final List<Item> cart;

  CartListState({this.cart = const []});

  @override
  List<Object?> get props => [this.cart];
}

class CartUpdatingState extends CartState {}
