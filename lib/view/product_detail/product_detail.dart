import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const routeName = '/product_detail';
  // final String title;
  // const ProductDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          " title,",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
