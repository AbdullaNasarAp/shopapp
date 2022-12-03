import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopapp/controller/constant/const.dart';
import 'package:shopapp/controller/models/provider/cart.dart';

class CartShow extends StatelessWidget {
  static const routeName = "cart_screen";
  const CartShow({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(
              15.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(
                8,
              ),
              child: Row(children: [
                Text(
                  "Total",
                  style: TextStyle(color: Colors.black),
                ),
                ksizeboxw,
                Chip(
                  label: Text(
                    "\$${cartt.totalAmount}",
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
