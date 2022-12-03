import 'package:flutter/material.dart';
import 'package:shopapp/view/product_detail/product_detail.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String id;
  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            trailing: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ],
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: id);
          },
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
