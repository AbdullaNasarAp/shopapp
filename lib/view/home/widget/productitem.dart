import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/cart.dart';
import 'package:shopapp/controller/provider/product.dart';
import 'package:shopapp/view/product_detail/product_detail.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            trailing: Row(
              children: [
                Consumer<Product>(builder: (context, value, child) {
                  return IconButton(
                    onPressed: () {
                      value.toggleFavorite();
                      if (value.isFavor) {
                        const snack = SnackBar(
                            duration: Duration(milliseconds: 400),
                            content: Text("Added to Favorite"));
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      } else {
                        const snack = SnackBar(
                            duration: Duration(milliseconds: 400),
                            content: Text("Removes from Favorite"));
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    },
                    icon: Icon(
                      value.isFavor ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                    ),
                  );
                }),
                IconButton(
                  onPressed: () {
                    cart.addItems(
                      product.id,
                      product.title,
                      product.price,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(
                          seconds: 1,
                        ),
                        content: const Text(
                          "Added item to cart",
                        ),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: () {
                            cart.removeSingleItem(product.id);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ],
            ),
            title: Text(
              product.title,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: product.id);
          },
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
