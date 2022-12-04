import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;
  const CartItems({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              title: const Text("Are you sure ?"),
              content: const Text(
                "Do you want to remove item from the cart ? ",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    "Sure",
                  ),
                ),
              ],
            );
          },
        );
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              child: FittedBox(child: Text("\$$price")),
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Total : \$${(price * quantity)}",
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            trailing: Text(
              "$quantity X",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
