import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/model/orderitem.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.order,
  });
  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "\$${order.amount}",
            ),
            subtitle: Text(
              DateFormat("dd MM yyyy hh:mm").format(
                order.dateTime,
              ),
            ),
          )
        ],
      ),
    );
  }
}
