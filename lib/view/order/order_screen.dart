import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/order.dart';
import 'package:shopapp/view/drawer/maindrawer.dart';
import 'package:shopapp/view/order/widgets/ordertile.dart';

class OrderScreen extends StatelessWidget {
  static const routeorder = "/order_screen";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersdata = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      drawer: const MainDrawer(),
      body: ordersdata.orders.isEmpty
          ? const Center(
              child: Text(
                "Please Order Anything",
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return OrderTile(order: ordersdata.orders[index]);
              },
              itemCount: ordersdata.orders.length,
            ),
    );
  }
}
