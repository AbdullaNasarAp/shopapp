import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopapp/model/cartitem.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.products,
  });
}
