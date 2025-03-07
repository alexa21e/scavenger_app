import 'package:flutter/material.dart';

class PlaceChecklist extends StatelessWidget {
  final String placeName;

  const PlaceChecklist({Key? key, required this.placeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(child: Text('Map Placeholder for $placeName')),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Detailed information about "$placeName" goes here.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
