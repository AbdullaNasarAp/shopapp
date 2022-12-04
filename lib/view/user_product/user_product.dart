import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/product_provider.dart';
import 'package:shopapp/view/drawer/maindrawer.dart';
import 'package:shopapp/view/editproduct/editproduct.dart';
import 'package:shopapp/view/user_product/widgets/user_product_tile.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeEdit);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                id: productsData.items[i].id,
                imageUrl: productsData.items[i].imageUrl,
                title: productsData.items[i].title,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
