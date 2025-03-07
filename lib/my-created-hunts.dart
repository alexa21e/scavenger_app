import 'package:flutter/material.dart';

class MyCreatedHunts extends StatelessWidget {
  const MyCreatedHunts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> hunts = [
      {
        'title': 'City Night Explorer',
        'startedBy': 'Creator A',
        'finishedBy': 4,
      },
      {
        'title': 'Nature Walk With Zombies',
        'startedBy': 'Creator B',
        'finishedBy': 6,
      },
      {
        'title': 'Adventure Trail Very',
        'startedBy': 'Creator C',
        'finishedBy': 2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Created Hunts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: hunts.length,
        itemBuilder: (context, index) {
          final hunt = hunts[index];
          return ListTile(
            leading: const Icon(Icons.map),
            title: Text(hunt['title']),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/editHunt',
                  arguments: hunt,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
