import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Account'),
            onTap: () {
              Navigator.pushNamed(context, '/myAccount');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('My Hunts'),
            onTap: () {
              Navigator.pushNamed(context, '/myHunts');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/editProfile');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('My Created Hunts'),
            onTap: () {
              // Placeholder for your hunts list
              Navigator.pushNamed(context, '/myCreatedHunts');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Placeholder for logout functionality
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}