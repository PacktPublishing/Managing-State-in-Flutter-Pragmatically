
import 'item.dart';

class CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final Item item;

  AddItemToCartEvent({required this.item});
}

class RemoveItemFromCartEvent extends CartEvent {
  final Item item;

  RemoveItemFromCartEvent({required this.item});
}
