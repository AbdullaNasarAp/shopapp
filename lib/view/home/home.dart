import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/view/home/widget/grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Product> loadProduct = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Shop App",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: const GridVieww());
  }
}
