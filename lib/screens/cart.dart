/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

import 'package:flutter/material.dart';
import 'package:lect9_sample/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';
import 'package:lect9_sample/model/Product.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  ///Cart is a stateless widget that accesses the contents
  ///of the ShoppingCart Provider
  ///This returns a Scafold with a column that has 3 children
  ///getItems(context) returns a widget
  ///a divider
  ///a Widget Class _CartTotal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getItems(context),
          const Divider(height: 4, color: Colors.black),
          _CartTotal()
        ],
      ),
    );
  }

  ///Returns a widget, it checks if a change happend to the
  ///shoppingCart provider, it uses the context.watch
  ///Context.watch listens to the changes in the model
  ///If the return products is empty, it will output the
  ///text No Item yet! if non-empty then it outputs a listview
  ///builder that contents the items inside the shoppingcart
  Widget getItems(BuildContext context) {
    List<Product> products = context.watch<ShoppingCart>().cart;
    return products.isEmpty
        ? const Text('No Items yet!')
        : Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.food_bank),
                  title: Text(products[index].name),
                  trailing: const Icon(Icons.delete),
                  onTap: () => context
                      .read<ShoppingCart>()
                      .removeItem(products[index].name),
                );
              },
            ),
          );
  }
} //end of cart

///The _CartTotal class is an example of a class
///that returns a widget that uses a Consumer
///a consumer. A consumer is used to allow
///getting a value from a provider eventhough
///the Buildcontext came from another widget.
///The consumer also is optimal because
///it only rebuilds a part of a code.
///The cart total returns a SizedBox that has
///2 elements the consumer for accessing the
///cart.totalPrice and the buy button that
///outputs a snackbar.
class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Consumer<ShoppingCart>(builder: (_, cart, __) {
              return Center(child: Text('Total Amount: \$${cart.totalPrice}'));
            })),
            Expanded(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Buying not supported yet.')));
                },
                child: const Text('Buy'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.read<ShoppingCart>().removeAll();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cart Cleared!')));
                },
                child: const Text('Clear Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
