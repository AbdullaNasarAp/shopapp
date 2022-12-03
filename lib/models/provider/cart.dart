import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _item;
  Map<String, CartItem> get items {
    return {..._item};
  }
  Cart(this._item)

  int get itemCount {
    return _item.length;
  }

  void addItems(String productId, String title, double price) {
    if (_item.containsKey(productId)) {
      // change quantity
      _item.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _item.putIfAbsent(
        productId,
        () => CartItem(
          quantity: 1,
          id: DateTime.now().toString(),
          title: title,
          price: price,
        ),
      );
    }
  }
}
