import 'package:flutter/material.dart';
import 'package:lect9_sample/screens/cart.dart';
import 'package:lect9_sample/screens/product_catalog.dart';
import 'screens/homepage.dart';
import 'package:provider/provider.dart';
import 'provider/counter_provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Counter()),
    ChangeNotifierProvider(create: (context) => ShoppingCart())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/cart': (context) => const Cart(),
        '/productCatalog': (context) => const ProductCatalog(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
