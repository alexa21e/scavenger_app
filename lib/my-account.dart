import 'package:flutter/material.dart';
import './menu-drawer.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Text(
          'This is the My Account screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
