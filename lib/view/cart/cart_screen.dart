import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopapp/controller/constant/const.dart';
import 'package:shopapp/controller/provider/cart.dart';
import 'package:shopapp/controller/provider/order.dart';
import 'package:shopapp/view/cart/widget/cartitem.dart';

class CartShow extends StatelessWidget {
  static const routeName = "cart_screen";
  const CartShow({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Cart",
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(
              15.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                8,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(color: Colors.black, fontSize: 19),
                    ),
                    Chip(
                      label: Text(
                        "\$${cartt.totalAmount}",
                        style: const TextStyle(fontSize: 17),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<Order>(context, listen: false).addOrder(
                          cartt.items.values.toList(),
                          cartt.totalAmount,
                        );
                        cartt.clearCart();
                        const snackBar = SnackBar(
                            content: Text("SuccessFully added to Order"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ]),
            ),
          ),
          ksizeboxh,
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return CartItems(
                productId: cartt.items.keys.toList()[index],
                id: cartt.items.values.toList()[index].id,
                title: cartt.items.values.toList()[index].title,
                price: cartt.items.values.toList()[index].price,
                quantity: cartt.items.values.toList()[index].quantity,
              );
            },
            itemCount: cartt.items.length,
          ))
        ],
      ),
    );
  }
}
