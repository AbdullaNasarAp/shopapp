import 'package:flutter/material.dart';
import 'package:shopapp/model/cartitem.dart';
import 'package:shopapp/model/orderitem.dart';

class Order with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get orders {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _order.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
