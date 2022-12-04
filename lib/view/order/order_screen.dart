import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/order.dart';
import 'package:shopapp/view/order/widgets/ordertile.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersdata = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrderTile(order: ordersdata.orders[index]);
        },
        itemCount: ordersdata.orders.length,
      ),
    );
  }
}
