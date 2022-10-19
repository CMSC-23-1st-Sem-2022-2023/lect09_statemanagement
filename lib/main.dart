/**
 * Created by: Katherine Loren Tan
 * Date Created: 18 October 2022
 * Description: Sample Lecture Code that uses 
 * the provider package
 * To be used by CMSC 23 C and D Students only.
 */

import 'package:flutter/material.dart';
import 'package:lect9_sample/screens/cart.dart';
import 'package:lect9_sample/screens/product_catalog.dart';
import 'screens/homepage.dart';
import 'package:provider/provider.dart';
import 'provider/counter_provider.dart';
import 'provider/shoppingcart_provider.dart';

/**
 Adds a multiprovider that has 2 changenotifier provider
 This is to take note of the changes of the Counter Provider
 and the ShoppingCart Provider
 * **/
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Counter()),
    ChangeNotifierProvider(create: (context) => ShoppingCart())
  ], child: const MyApp()));
}

/// Setup the routes of the pages
/// 3 pages for the app
/// MyHomePage, Cart and Product Catalog

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
