import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/provider/cart.dart';
import 'package:shopapp/models/provider/product.dart';
import 'package:shopapp/view/home/widget/badge.dart';
import 'package:shopapp/view/home/widget/grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var showFavoriteOnly = false;
  final List<Product> loadProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Shop App",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOption selected) {
                setState(() {
                  if (selected == FilterOption.favorites) {
                    showFavoriteOnly = true;
                  } else {
                    showFavoriteOnly = false;
                  }
                });
              },
              icon: const Icon(Icons.more_horiz),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: FilterOption.favorites,
                  child: Text(
                    "Only Favorite",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const PopupMenuItem(
                  value: FilterOption.all,
                  child: Text(
                    "Show all ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (context, value, child) {
                return Badge(
                  value: value.itemCount.toString(),
                  color: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_bag,
                    ),
                    onPressed: () {},
                  ),
                );
              },
            )
          ],
        ),
        body: GridVieww(showOnly: showFavoriteOnly));
  }
}

enum FilterOption {
  favorites,
  all,
}
