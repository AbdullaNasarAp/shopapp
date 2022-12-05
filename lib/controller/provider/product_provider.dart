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

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shopapp/controller/provider/product.dart';
// import 'package:shopapp/model/http_exception.dart';

// class Products with ChangeNotifier {
//   List<Productt> _items = [];

//   Future<void> fetchAndSetProducts() async {
//     const url = 'https://flutter-update.firebaseio.com/products.json';
//     try {
//       final response = await http.get(Uri.parse(url));
//       final extractedData = json.decode(response.body) as Map<String, dynamic>;
//       if (extractedData == null) {
//         return;
//       }
//       final List<Productt> loadedProducts = [];
//       extractedData.forEach((prodId, prodData) {
//         loadedProducts.add(Productt(
//           id: prodId,
//           title: prodData['title'],
//           description: prodData['description'],
//           price: prodData['price'],
//           isFavor: prodData['isFavorite'],
//           imageUrl: prodData['imageUrl'],
//         ));
//       });
//       _items = loadedProducts;
//       notifyListeners();
//     } catch (error) {
//       throw (error);
//     }
//   }


//   Future<void> addProduct(Productt product) async {
//     const url = 'https://flutter-update.firebaseio.com/products.json';
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: json.encode({
//           'title': product.title,
//           'description': product.description,
//           'imageUrl': product.imageUrl,
//           'price': product.price,
//           'isFavorite': product.isFavor,
//         }),
//       );
//       final newProduct = Productt(
//         title: product.title,
//         description: product.description,
//         price: product.price,
//         imageUrl: product.imageUrl,
//         id: json.decode(response.body)['name'],
//       );
//       _items.add(newProduct);
//       // _items.insert(0, newProduct); // at the start of the list
//       notifyListeners();
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }

//   Future<void> updateProduct(String id, Productt newProduct) async {
//     final prodIndex = _items.indexWhere((prod) => prod.id == id);
//     if (prodIndex >= 0) {
//       final url = 'https://flutter-update.firebaseio.com/products/$id.json';
//       await http.patch(Uri.parse(url),
//           body: json.encode({
//             'title': newProduct.title,
//             'description': newProduct.description,
//             'imageUrl': newProduct.imageUrl,
//             'price': newProduct.price
//           }));
//       _items[prodIndex] = newProduct;
//       notifyListeners();
//     } else {
//       print('...');
//     }
//   }

//   Future<void> deleteProduct(String id) async {
//     final url = 'https://flutter-update.firebaseio.com/products/$id.json';
//     final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
//     Productt? existingProduct = _items[existingProductIndex];
//     _items.removeAt(existingProductIndex);
//     notifyListeners();
//     final response = await http.delete(Uri.parse(url));
//     if (response.statusCode >= 400) {
//       _items.insert(existingProductIndex, existingProduct);
//       notifyListeners();
//       throw HttpException(
//         message: 'Could not delete product.',
//       );
//     }
//     existingProduct = null;
//   }
// }
