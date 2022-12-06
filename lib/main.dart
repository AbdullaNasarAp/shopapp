import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/auth.dart';
import 'package:shopapp/screens/auth_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';

import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, value, _) {
          return MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.w600, fontFamily: 'NerkoOne'),
                bodyText2: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontWeight: FontWeight.w600,
                ),
                headline1: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontWeight: FontWeight.w900,
                ),
                headline2: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontWeight: FontWeight.w900,
                ),
                subtitle1: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontWeight: FontWeight.w900,
                ),
                subtitle2: TextStyle(
                  fontFamily: 'NerkoOne',
                  fontWeight: FontWeight.w900,
                ),
              ),
              fontFamily: 'Kenia',
              colorScheme:
                  ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
                secondary: Colors.deepOrange,
              ),
            ),
            home: value.isAuth ? ProductsOverviewScreen() : AuthScreen(),
            routes: {
              ProductDetailScreen.routeName: (ctx) =>
                  const ProductDetailScreen(),
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => const EditProductScreen(),
            },
          );
        },
      ),
    );
  }
}
