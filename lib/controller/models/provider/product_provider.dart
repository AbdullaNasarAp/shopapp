import 'package:flutter/material.dart';
import 'package:shopapp/controller/models/provider/product.dart';

class ProductProvider with ChangeNotifier {
  /////////////////////////////list Product ///////////////////////////////////////
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'assets/image/mahdi-bafande-npyWFYpHQ94-unsplash.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'assets/image/mohamad-khosravi-4fkUAduhoSY-unsplash.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'assets/image/nimble-made-BKYeLLB1OxI-unsplash.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'assets/image/santhosh-kumar-RqYTuWkTdEs-unsplash.jpg',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((pdtItem) => pdtItem.isFavor).toList();
    // }
    return [..._items];
  }

  List<Product> get favotesItem {
    return _items.where((prodItem) => prodItem.isFavor).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

/////////////////////item find by using id //////////////////////////////////////
  Product findById(String id) {
    return _items.firstWhere(
      (prodt) => prodt.id == id,
    );
  }

  void addProduct() {
    notifyListeners();
  }
}
