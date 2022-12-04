import 'package:flutter/material.dart';
import 'package:shopapp/view/order/order_screen.dart';
import 'package:shopapp/view/user_product/user_product.dart';
import 'package:shopapp/view/user_product/widgets/user_product_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              "Hello Friends !",
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text(
                "Shop",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text(
                "Orders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  OrderScreen.routeorder,
                );
              }),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text(
                "Manage Product ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  UserProductsScreen.routeName,
                );
              })
        ],
      ),
    );
  }
}
