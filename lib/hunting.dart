import 'package:flutter/material.dart';
import './place-checklist.dart';

class Hunting extends StatelessWidget {
  const Hunting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hunting'),
      ),
      body: Column(
        children: [
          Container(
            height: 700,
            color: Colors.grey[300],
            child: const Center(child: Text('Map Placeholder')),
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PlaceChecklist(placeName: 'White land'),
              ),
            );
          },
          child: const Text('Give me next marker'),
        ),
      ),
    );
  }
}
