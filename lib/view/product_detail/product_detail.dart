import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/models/provider/product_provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const routeName = '/product_detail';
  // final String title;
  // const ProductDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context, listen: false).findById(routeArg);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
