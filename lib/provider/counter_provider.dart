/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

import 'package:flutter/material.dart';

///This is a Counter Provider, it uses the
///ChangeNotifier from the provider package
///it has a _count variable initialized to zero
///it as several methods and a getter.

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  ///For the methods to show the changes
  ///the method notifyListners should be invoked
  ///otherwise, no changes will be recorded
  ///consider this as a trigger button whenever
  ///a change happend in the provider.

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
