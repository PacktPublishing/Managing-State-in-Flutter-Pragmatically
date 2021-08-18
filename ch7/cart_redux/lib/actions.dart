import 'item.dart';

class Actions {}

class AddItemToCartAction extends Actions {
  final Item item;

  AddItemToCartAction({required this.item});
}

class RemoveItemFromCartAction extends Actions {
  final Item item;

  RemoveItemFromCartAction({required this.item});
}
