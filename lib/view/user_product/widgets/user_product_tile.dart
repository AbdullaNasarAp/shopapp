import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/product_provider.dart';
import 'package:shopapp/view/editproduct/editproduct.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  const UserProductItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<Products>(context, listen: false).deleteProduct(id);
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
