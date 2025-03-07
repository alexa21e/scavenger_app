import 'package:flutter/material.dart';

class HuntsModel extends ChangeNotifier {
  final List<String> _hunts = ['Downtown Adventure', 'Nature Trail Quest'];

  List<String> get hunts => _hunts;

  void addHunt(String title) {
    _hunts.add(title);
    notifyListeners();
  }
}
