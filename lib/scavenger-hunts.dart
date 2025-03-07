import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hunts_model.dart';
import './menu-drawer.dart';

class ScavengerHunts extends StatelessWidget {
  final List<String> notifications = [
    'john213 made progress on your hunt "City Explorer".',
    'an90op made progress on your hunt "Nature Walk"',
  ];

  ScavengerHunts({Key? key}) : super(key: key);

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Notifications'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.notification_important),
                  title: Text(notifications[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hunts = Provider.of<HuntsModel>(context).hunts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger hunts available'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              _showNotifications(context);
            },
          ),
        ],
      ),
      drawer: MenuDrawer(),
      body: ListView.builder(
        itemCount: hunts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.place),
            title: Text(hunts[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/hunting');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createHunt');
        },
        child: const Icon(Icons.add),
        tooltip: 'Create New Hunt',
      ),
    );
  }
}
