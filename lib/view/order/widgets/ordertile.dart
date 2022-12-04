import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/model/orderitem.dart';

class OrderTile extends StatefulWidget {
  const OrderTile({
    super.key,
    required this.order,
  });
  final OrderItem order;

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "\$${widget.order.amount}",
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            subtitle: Text(
              DateFormat("dd/MM/yyyy \n hh:mm").format(
                widget.order.dateTime,
              ),
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              icon: Icon(
                expanded ? Icons.expand_less : Icons.expand_more,
              ),
            ),
          ),
          if (expanded)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: min(
                widget.order.products.length * 20.0 + 100,
                180,
              ),
              child: ListView(
                children: widget.order.products.map((pdt) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pdt.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${pdt.quantity}x\$${pdt.price}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
