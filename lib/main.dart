import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/cart.dart';
import 'package:shopapp/controller/provider/order.dart';
import 'package:shopapp/controller/provider/product_provider.dart';
import 'package:shopapp/view/cart/cart_screen.dart';
import 'package:shopapp/view/editproduct/editproduct.dart';
import 'package:shopapp/view/home/home.dart';
import 'package:shopapp/view/order/order_screen.dart';
import 'package:shopapp/view/product_detail/product_detail.dart';
import 'package:shopapp/view/user_product/user_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          primarySwatch: Colors.blueGrey,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontFamily: 'Montserrat-VariableFont_wght',
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
                fontFamily: 'Montserrat-VariableFont_wght',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            subtitle1: TextStyle(
                fontFamily: 'Montserrat-VariableFont_wght',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            subtitle2: TextStyle(
                fontFamily: 'Montserrat-VariableFont_wght',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          ProductDetail.routeName: (context) => const ProductDetail(),
          CartShow.routeName: (context) => const CartShow(),
          OrderScreen.routeorder: (context) => const OrderScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
          EditProductScreen.routeName: (context) => const EditProductScreen()
        },
      ),
    );
  }
}
