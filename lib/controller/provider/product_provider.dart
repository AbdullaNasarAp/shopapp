// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:shopapp/controller/provider/product.dart';

// class ProductProvider with ChangeNotifier {
//   /////////////////////////////list Product ///////////////////////////////////////
//   final List<Product> _items = [
//     Product(
//       id: 'p1',
//       title: 'Red Shirt',
//       description: 'A red shirt - it is pretty red!',
//       price: 29.99,
//       imageUrl:
//           'https://img.freepik.com/free-photo/fit-sexy-young-black-man-with-afro-wearing-clean-unlabeled-white-t-shirt_346278-996.jpg',
//     ),
//     Product(
//       id: 'p2',
//       title: 'Trousers',
//       description: 'A nice pair of trousers.',
//       price: 59.99,
//       imageUrl:
//           'https://media.istockphoto.com/id/515750480/photo/mans-white-t-shirt.jpg?s=612x612&w=0&k=20&c=qKNa13XtQkx0ZPt7HcEGNan6ey_A1yWmZc5bKAJuWFE=',
//     ),
//     Product(
//       id: 'p3',
//       title: 'Yellow Scarf',
//       description: 'Warm and cozy - exactly what you need for the winter.',
//       price: 19.99,
//       imageUrl:
//           'https://www.beyoung.in/api/cache/catalog/products/images_for_customized_products_26_4_2022/custom_t-shirt_men_base_26_4_2022_400x533.jpg',
//     ),
//     Product(
//       id: 'p4',
//       title: 'A Pan',
//       description: 'Prepare any meal you want.',
//       price: 49.99,
//       imageUrl:
//           'https://www.mydesignation.com/wp-content/uploads/2022/06/PRINTED-TSHIRTS-HOME-PAGE-IMAGE-MYDESIGNATION-LATEST-IMAGE-ASTRO-KATHAKALI-TSHIRT.jpg',
//     ),
//   ];

//   // var _showFavoritesOnly = false;

//   List<Product> get items {
//     // if (_showFavoritesOnly) {
//     //   return _items.where((pdtItem) => pdtItem.isFavor).toList();
//     // }
//     return [..._items];
//   }

//   List<Product> get favotesItem {
//     return _items.where((prodItem) => prodItem.isFavor).toList();
//   }

// /////////////////////item find by using id //////////////////////////////////////
//   Product findById(String id) {
//     return _items.firstWhere(
//       (prodt) => prodt.id == id,
//     );
//   }

//   void addProduct(Product product) {
//     final url =
//         "https://shopapp-a7e14-default-rtdb.firebaseio.com/products.json";
//     http.post(
//         Uri.parse(
//           url,
//         ),
//         body: json.encode({
//           'title': product.title,
//           'description': product.description,
//           'imageUrl': product.imageUrl,
//           'price': product.price,
//           'isFavor': product.isFavor,
//         }));
//     final _newProduct = Product(
//       id: DateTime.now().toString(),
//       title: product.title,
//       description: product.description,
//       imageUrl: product.imageUrl,
//       price: product.price,
//     );
//     _items.insert(0, _newProduct);
//     notifyListeners();
//   }

//   void updateProduct(String id, Product newProduct) {
//     final prodIndex = _items.indexWhere((prod) => prod.id == id);
//     if (prodIndex >= 0) {
//       _items[prodIndex] = newProduct;
//       notifyListeners();
//     } else {
//       print('...');
//     }
//   }

//   void deleteProduct(String id) {
//     _items.removeWhere((pdt) => pdt.id == id);
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  final List<Productt> _items = [
    Productt(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Productt(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Productt(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Productt(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Productt> get items {
    return [..._items];
  }

  List<Productt> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavor).toList();
  }

  Productt findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Productt product) {
    const url =
        'https://shopapp-a7e14-default-rtdb.firebaseio.com/products.json';
    return http
        .post(
      Uri.parse(url),
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavor,
      }),
    )
        .then((response) {
      final newProduct = Productt(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.insert(0, newProduct);
      notifyListeners();
    }).catchError((error) {
      print(error);
      throw error;
    });
  }

  void updateProduct(String id, Productt newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      log('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
