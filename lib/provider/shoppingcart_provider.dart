import 'package:flutter/material.dart';
import 'package:lect9_sample/model/Product.dart';

class ShoppingCart with ChangeNotifier {
  final List<Product> _shoppingList = [];

  int get count => _shoppingList.length;
  List<Product> get cart => _shoppingList;

  void addItem(Product item) {
    _shoppingList.add(item);
    notifyListeners();
  }

  void removeAll() {
    _shoppingList.clear();
    notifyListeners();
  }

  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        _shoppingList.remove(_shoppingList[i]);
      }
    }
    notifyListeners();
  }

  double totalPrices() {
    double sum = 0;
    for (int i = 0; i < _shoppingList.length; i++) {
      sum = _shoppingList[i].price + sum;
    }
    return sum;
  }

  get totalPrice => totalPrices();
}
