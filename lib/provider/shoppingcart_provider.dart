/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

import 'package:flutter/material.dart';
import 'package:lect9_sample/model/Product.dart';

///The shopping cart uses the changenotifier
///from the provider package.
///It has a class variable _shoppingList that
///contains all the products selected by the user
///from the productCatalog

class ShoppingCart with ChangeNotifier {
  final List<Product> _shoppingList = [];

  int get count => _shoppingList.length;
  List<Product> get cart => _shoppingList;

  ///The methods addItem, removeAll, RemoveItem
  ///uses the notifyListeners because they change
  ///the state of the _shoppingList

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

  ///This is for computing the total Prices
  double totalPrices() {
    double sum = 0;
    for (int i = 0; i < _shoppingList.length; i++) {
      sum = _shoppingList[i].price + sum;
    }
    return sum;
  }

  /// This is for returning the total prices.
  get totalPrice => totalPrices();
}
