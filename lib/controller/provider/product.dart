import 'package:flutter/cupertino.dart';

class Productt with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavor;

  Productt({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavor = false,
  });

  void toggleFavorite() {
    isFavor = !isFavor;
    notifyListeners();
  }
}
