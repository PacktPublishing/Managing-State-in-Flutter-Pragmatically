import 'package:equatable/equatable.dart';

import 'item.dart';

class CartState extends Equatable {
  final List<Item> cart;

  CartState({this.cart = const []});

  @override
  List<Object?> get props => [this.cart];
}

class CartUpdatingState {}
