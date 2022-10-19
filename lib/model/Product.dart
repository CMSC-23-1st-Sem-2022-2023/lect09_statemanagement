/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

/// Create a Product Model that has the
///  name and price of the item
/// with getters for the name and price.

class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);

  String get name => _name;

  double get price => _price;
}
