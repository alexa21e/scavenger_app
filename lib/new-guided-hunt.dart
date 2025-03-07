// lib/screens/new_guided_hunt.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hunts_model.dart';
import './menu-drawer.dart';

class NewGuidedHunt extends StatelessWidget {
  // Create a controller to read the input from the text field
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Guided Hunt'),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Hunt Title'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                if (title.isNotEmpty) {
                  // Add the new hunt to the shared HuntsModel
                  Provider.of<HuntsModel>(context, listen: false).addHunt(title);
                  // Optionally clear the text field or show a success message
                  titleController.clear();
                  // Navigate back to the hunt list screen
                  Navigator.pushNamed(context, '/scavenger-hunts');
                }
              },
              child: Text('Add hunt'),
            ),
          ],
        ),
      ),
    );
  }
}
