import 'package:flutter/material.dart';
import './menu-drawer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Text(
          'This is the edit profile screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}