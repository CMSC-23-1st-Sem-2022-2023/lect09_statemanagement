/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

import 'package:flutter/material.dart';
import 'package:lect9_sample/model/Product.dart';
import 'package:lect9_sample/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({super.key});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

///Creates a Product list available
///outputs a ListView.builder that contains a
///list of Product objects

class _ProductCatalogState extends State<ProductCatalog> {
  List<Product> products = [
    Product('Apple', 1.5),
    Product('Orange', 1.25),
    Product('Grapes', 2.40),
    Product('Kiwi', 5.25)
  ];
  @override
  Widget build(BuildContext context) {
    ///On the onTap function,
    ///It accesses/reads the function inside the ShoppingCart Provider
    ///it invokes the addItem function at accepts a Product object.
    ///outputs a snackbar that the item is successfully added.
    return Scaffold(
      appBar: AppBar(title: const Text('Product Catalog')),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.food_bank),
                title: Text(products[index].name),
                trailing: const Icon(Icons.add),
                onTap: () {
                  context.read<ShoppingCart>().addItem(products[index]);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Added ${products[index].name}!')));
                },
              );
            },
          ),
        ),
      ]),

      ///In this part, it only creates a floating action button
      ///that we click, goes to the /cart or instansiates cart.

      floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: () => {Navigator.pushNamed(context, '/cart')},
          key: const Key('view_cart'),
          tooltip: 'View Cart',
          child: const Icon(Icons.money)),
    );
  }
}
