import 'package:flutter/material.dart';
import 'package:lect9_sample/model/Product.dart';
import 'package:lect9_sample/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({super.key});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  List<Product> products = [
    Product('Apple', 1.5),
    Product('Orange', 1.25),
    Product('Grapes', 2.40),
    Product('Kiwi', 5.25)
  ];
  @override
  Widget build(BuildContext context) {
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
                },
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: () => {Navigator.pushNamed(context, '/cart')},
          key: const Key('view_cart'),
          tooltip: 'View Cart',
          child: const Icon(Icons.money)),
    );
  }
}
