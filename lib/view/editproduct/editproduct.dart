// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopapp/controller/provider/product.dart';
// import 'package:shopapp/controller/provider/product_provider.dart';

// class EditProductScreen extends StatefulWidget {
//   static const routeEdit = "/editproduct";
//   const EditProductScreen({super.key});

//   @override
//   State<EditProductScreen> createState() => _EditProductScreenState();
// }

// class _EditProductScreenState extends State<EditProductScreen> {
// final _priceFocusNode = FocusNode();
//   final _descriptionFocusNode = FocusNode();
//   final _imageUrlController = TextEditingController();
//   final _imageUrlFocusNode = FocusNode();

//   final _formk = GlobalKey<FormState>();
//   var _editproduct = Product(
//     id: '',
//     title: '',
//     description: '',
//     imageUrl: '',
//     price: 0,
//   );
//   var _isInit = true;

//   var _initValue = {
//     'title': '',
//     'description': '',
//     'price': '',
//     'imageURL': '',
//   };

//   @override
//   void initState() {
//     _imageurlfocusNode.addListener(updateImageUrl);
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       final productId = ModalRoute.of(context)?.settings.arguments;
//       if (productId != null) {
//         _editproduct = Provider.of<ProductProvider>(context, listen: false)
//             .findById(productId.toString());
//         _initValue = {
//           'title': _editproduct.title,
//           'description': _editproduct.description,
//           'price': _editproduct.price.toString(),
//           'imageURL': '',
//         };
//         _imageurlController.text = _editproduct.imageUrl;
//       }
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     _imageUrlFocusNode.removeListener(updateImageUrl);
//     _priceFocusNode.dispose();
//     _descriptionFocusNode.dispose();
//     _imageUrlController.dispose();
//     _imageUrlFocusNode.dispose();
//     super.dispose();
//   }
//   void updateImageUrl() {
//     if (!_imageurlfocusNode.hasFocus) {
//       if (((!_imageurlController.text.startsWith("http") &&
//               !_imageurlController.text.startsWith("https")) ||
//           (!_imageurlController.text.endsWith(".png") &&
//               !_imageurlController.text.endsWith(".jpg") &&
//               !_imageurlController.text.endsWith(".jpeg")))) {
//         return;
//       }
//       setState(() {});
//     }
//   }

//   void _saveForm() {
//     final _isValidate = _formk.currentState!.validate();
//     if (!_isValidate) {
//       return;
//     }
//     _formk.currentState!.save();
//     if (_editproduct.id != null) {
//       Provider.of<ProductProvider>(context, listen: false)
//           .updateProduct(_editproduct.id, _editproduct);
//     } else {}

//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Editing Product"),
//         actions: [
//           IconButton(
//             onPressed: _saveForm,
//             icon: const Icon(
//               Icons.save_alt,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//             key: _formk,
//             child: ListView(
//               children: [
//                 TextFormField(
//                   initialValue: _initValue['title'],
//                   style: const TextStyle(color: Colors.black),
//                   decoration: const InputDecoration(
//                     label: Text(
//                       "Title",
//                     ),
//                   ),
//                   textInputAction: TextInputAction.next,
//                   onFieldSubmitted: (_) {
//                     FocusScope.of(context).requestFocus(_pricefocusNode);
//                   },
//                   onSaved: (newValue) {
//                     _editproduct = Product(
//                       title: newValue.toString(),
//                       description: _editproduct.description,
//                       imageUrl: _editproduct.imageUrl,
//                       price: _editproduct.price,
//                       id: _editproduct.id,
//                       isFavor: _editproduct.isFavor,
//                     );
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter the title";
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: _initValue['price'],
//                   style: const TextStyle(color: Colors.black),
//                   decoration: const InputDecoration(
//                     label: Text(
//                       "Price",
//                     ),
//                   ),
//                   textInputAction: TextInputAction.next,
//                   keyboardType:
//                       const TextInputType.numberWithOptions(decimal: true),
//                   focusNode: _pricefocusNode,
//                   onFieldSubmitted: (_) {
//                     FocusScope.of(context).requestFocus(_descriptionfocusNode);
//                   },
//                   onSaved: (newValue) {
//                     _editproduct = Product(
//                       title: _editproduct.title,
//                       description: _editproduct.description,
//                       imageUrl: _editproduct.imageUrl,
//                       price: double.parse(newValue.toString()),
//                       id: _editproduct.id,
//                       isFavor: _editproduct.isFavor,
//                     );
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter a Price.";
//                     }
//                     if (double.tryParse(value) == null) {
//                       return "Enter a valid Price.";
//                     }
//                     if (double.parse(value) < 0) {
//                       return "Enter the price greater than Zero. ";
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: _initValue['description'],
//                   style: const TextStyle(color: Colors.black),
//                   decoration: const InputDecoration(
//                     label: Text(
//                       "Description",
//                     ),
//                   ),
//                   maxLines: 4,
//                   textInputAction: TextInputAction.next,
//                   keyboardType: TextInputType.multiline,
//                   focusNode: _descriptionfocusNode,
//                   onSaved: (newValue) {
//                     _editproduct = Product(
//                       title: _editproduct.title,
//                       description: newValue.toString(),
//                       imageUrl: _editproduct.imageUrl,
//                       price: _editproduct.price,
//                       id: _editproduct.id,
//                       isFavor: _editproduct.isFavor,
//                     );
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Enter a description";
//                     }
//                     if (value.length < 10) {
//                       return "Enter description with atleast 10 words.";
//                     }
//                     return null;
//                   },
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Container(
//                         width: 100,
//                         height: 100,
//                         margin: const EdgeInsets.only(
//                           top: 8,
//                           right: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 1,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         child: _imageurlController.text.isEmpty
//                             ? const Center(
//                                 child: Text(
//                                   "Enter a URL",
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 15),
//                                 ),
//                               )
//                             : FittedBox(
//                                 fit: BoxFit.contain,
//                                 child: Image.network(
//                                   _imageurlController.text,
//                                 ),
//                               )),
//                     Expanded(
//                       child: TextFormField(
//                         style: const TextStyle(color: Colors.black),
//                         decoration: const InputDecoration(
//                           labelText: "Image URL",
//                         ),
//                         keyboardType: TextInputType.url,
//                         textInputAction: TextInputAction.done,
//                         controller: _imageurlController,
//                         focusNode: _imageurlfocusNode,
//                         onEditingComplete: () {
//                           setState(() {});
//                         },
//                         onFieldSubmitted: (_) {
//                           _saveForm();
//                         },
//                         onSaved: (newValue) {
//                           _editproduct = Product(
//                             title: _editproduct.title,
//                             description: _editproduct.description,
//                             imageUrl: newValue.toString(),
//                             price: _editproduct.price,
//                             id: _editproduct.id,
//                             isFavor: _editproduct.isFavor,
//                           );
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter a ImageUrl";
//                           }
//                           if (!value.startsWith("http") &&
//                               !value.startsWith("https")) {
//                             return "Please enter a valid URL";
//                           }
//                           if (!value.endsWith(".png") &&
//                               !value.endsWith(".jpg") &&
//                               !value.endsWith(".jpeg")) {
//                             return "Please enter a valid URL";
//                           }
//                           return null;
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/product.dart';
import 'package:shopapp/controller/provider/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const EditProductScreen({super.key});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Productt(
    id: null.toString(),
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(productId.toString());
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id == null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    } else {
      Provider.of<Products>(context, listen: false)
          .addProduct(_editedProduct)
          .catchError((error) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog();
          },
        );
      }).then((_) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      });
    }
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: const InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Productt(
                            title: value!,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            isFavor: _editedProduct.isFavor);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: const InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Productt(
                            title: _editedProduct.title,
                            price: double.parse(value!),
                            description: _editedProduct.description,
                            imageUrl: _editedProduct.imageUrl,
                            id: _editedProduct.id,
                            isFavor: _editedProduct.isFavor);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description.';
                        }
                        if (value.length < 10) {
                          return 'Should be at least 10 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Productt(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: value.toString(),
                          imageUrl: _editedProduct.imageUrl,
                          id: _editedProduct.id,
                          isFavor: _editedProduct.isFavor,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? const Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Productt(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                description: _editedProduct.description,
                                imageUrl: value.toString(),
                                id: _editedProduct.id,
                                isFavor: _editedProduct.isFavor,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
