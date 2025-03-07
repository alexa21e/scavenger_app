import 'package:flutter/material.dart';

class MyHunts extends StatelessWidget {
  const MyHunts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> hunts = [
      'City Explorer',
      'Nature Walk',
      'Historical Quest',
      'Adventure Trail',
      'Urban Mystery',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hunts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: hunts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.map),
            title: Text(hunts[index]),
          );
        },
      ),
    );
  }
}
