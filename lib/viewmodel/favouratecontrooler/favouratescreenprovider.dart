import 'dart:developer';

import 'package:flutter/material.dart';

class favouratescreen extends ChangeNotifier {
  final List<int> _favList = [];
  bool showfav = false;
  List<int> get list => _favList;
  void addItem(
    int index,
  ) {
    _favList.add(index);
    log(_favList.toString());
    notifyListeners();
  }

  void removeItem(int index) {
    _favList.remove(index);
    log(_favList.toString());
    notifyListeners();
  }
}
