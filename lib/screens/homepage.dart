/// Created by: Katherine Loren Tan
/// Date Created: 18 October 2022
/// Description: Sample Lecture Code that uses
/// the provider package
/// To be used by CMSC 23 C and D Students only.

import 'package:flutter/material.dart';
import '../provider/counter_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Sample Provider ${context.watch<Counter>().count}')),
      body: Center(
          child: Column(
        children: [
          const ViewCounter(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/productCatalog');
              },
              child: const Text('Go to Product Catalog')),
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => {context.read<Counter>().decrement()},
              key: const Key('decrement_floatingActionButton'),
              tooltip: 'Decrease',
              child: const Icon(Icons.remove)),
          const SizedBox(width: 5),
          FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => {context.read<Counter>().reset()},
              key: const Key('reset_floatingActionButton'),
              tooltip: 'Reset',
              child: const Icon(Icons.exposure_zero)),
          const SizedBox(width: 5),
          FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => {context.read<Counter>().increment()},
              key: const Key('add_floatingActionButton'),
              tooltip: 'Increase',
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

class ViewCounter extends StatelessWidget {
  const ViewCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Clicked this many times ${context.watch<Counter>().count} ');
  }
}
