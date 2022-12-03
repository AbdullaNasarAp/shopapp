import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/provider/product_provider.dart';
import 'package:shopapp/view/home/home.dart';
import 'package:shopapp/view/product_detail/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          primarySwatch: Colors.blueGrey,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
            bodyText2: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            subtitle1: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.white,
            ),
            subtitle2: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
        home: HomeScreen(),
        routes: {ProductDetail.routeName: (context) => const ProductDetail()},
      ),
    );
  }
}
