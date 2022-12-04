import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopapp/controller/provider/product.dart';

class ProductProvider with ChangeNotifier {
  /////////////////////////////list Product ///////////////////////////////////////
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://img.freepik.com/free-photo/fit-sexy-young-black-man-with-afro-wearing-clean-unlabeled-white-t-shirt_346278-996.jpg?w=2000',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://media.istockphoto.com/id/515750480/photo/mans-white-t-shirt.jpg?s=612x612&w=0&k=20&c=qKNa13XtQkx0ZPt7HcEGNan6ey_A1yWmZc5bKAJuWFE=',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.beyoung.in/api/cache/catalog/products/images_for_customized_products_26_4_2022/custom_t-shirt_men_base_26_4_2022_400x533.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.mydesignation.com/wp-content/uploads/2022/06/PRINTED-TSHIRTS-HOME-PAGE-IMAGE-MYDESIGNATION-LATEST-IMAGE-ASTRO-KATHAKALI-TSHIRT.jpg',
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

  void addProduct(Product product) {
    final _newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );
    _items.insert(0, _newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((pdt) => pdt.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      log(".......");
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((pdt) => pdt.id == id);
    notifyListeners();
  }
}
