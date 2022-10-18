import 'package:flutter/material.dart';
import 'package:lect9_sample/provider/shoppingcart_provider.dart';
import 'package:provider/provider.dart';
import 'package:lect9_sample/model/Product.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

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

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ShoppingCart>(builder: (_, cart, __) {
              return Center(child: Text('Total Amount: \$${cart.totalPrice}'));
            }),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
