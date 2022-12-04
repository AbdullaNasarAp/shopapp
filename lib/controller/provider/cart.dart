import 'package:flutter/material.dart';
import 'package:shopapp/model/cartitem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};
  Map<String, CartItem> get items {
    return {..._item};
  }

  int get itemCount {
    return _item == null ? 0 : _item.length;
  }

  double get totalAmount {
    var total = 0.0;
    _item.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItems(String productId, String title, double price) {
    if (_item.containsKey(productId)) {
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
    notifyListeners();
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_item.containsKey(productId)) {
      return;
    }
    if (_item[productId]!.quantity > 1) {
      _item.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity - 1,
              ));
    } else {
      _item.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _item = {};
    notifyListeners();
  }
}

// import 'package:flutter/foundation.dart';

// class CartItem {
//   final String id;
//   final String title;
//   final int quantity;
//   final double price;

//   CartItem({
//     required this.id,
//     required this.title,
//     required this.quantity,
//     required this.price,
//   });
// }

// class Cart with ChangeNotifier {
//   Map<String, CartItem> _items = {};

//   Map<String, CartItem> get items {
//     return {..._items};
//   }

//   int get itemCount {
//     return _items.length;
//   }

//   void addItem(
//     String productId,
//     double price,
//     String title,
//   ) {
//     if (_items.containsKey(productId)) {
//       // change quantity...
//       _items.update(
//         productId,
//         (existingCartItem) => CartItem(
//           id: existingCartItem.id,
//           title: existingCartItem.title,
//           price: existingCartItem.price,
//           quantity: existingCartItem.quantity + 1,
//         ),
//       );
//     } else {
//       _items.putIfAbsent(
//         productId,
//         () => CartItem(
//           id: DateTime.now().toString(),
//           title: title,
//           price: price,
//           quantity: 1,
//         ),
//       );
//     }
//     notifyListeners();
//   }
// }
