import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/constant/const.dart';
import 'package:shopapp/controller/provider/product_provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const routeName = '/product_detail';
  // final String title;
  // const ProductDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context, listen: false).findById(routeArg);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            ksizeboxh,
            Text(
              "\$${loadedProduct.price}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            ksizeboxh,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
