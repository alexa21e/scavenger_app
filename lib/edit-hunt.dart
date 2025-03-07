import 'package:flutter/material.dart';

class EditHunt extends StatefulWidget {
  const EditHunt({Key? key}) : super(key: key);

  @override
  _EditHuntState createState() => _EditHuntState();
}

class _EditHuntState extends State<EditHunt  > {
  List<TextEditingController> _controllers = [];
  List<String> _places = [];
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final hunt = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (hunt != null && hunt['places'] != null && hunt['places'] is List<String>) {
        _places = List<String>.from(hunt['places']);
      } else {
        _places = ['Example Place 1', 'Example Place 2'];
      }
      _controllers = _places.map((place) => TextEditingController(text: place)).toList();
      _initialized = true;
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveChanges() {
    for (int i = 0; i < _controllers.length; i++) {
      _places[i] = _controllers[i].text;
    }
    Navigator.pop(context, _places);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Hunt'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _controllers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: _controllers[index],
                decoration: InputDecoration(
                  labelText: 'Place ${index + 1}',
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPlace = await Navigator.pushNamed(context, '/addPlace');
          if (newPlace != null && newPlace is String) {
            setState(() {
              _places.add(newPlace);
              _controllers.add(TextEditingController(text: newPlace));
            });
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Add new place',
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: _saveChanges,
          child: const Text('Save Changes'),
        ),
      ),
    );
  }
}