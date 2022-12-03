import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/provider/product_provider.dart';
import 'package:shopapp/view/home/widget/productitem.dart';

class GridVieww extends StatelessWidget {
  const GridVieww({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final product = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          id: product[index].id,
          title: product[index].title,
          image: product[index].imageUrl,
        );
      },
    );
  }
}
