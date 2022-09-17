
import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/view/themechnager/themechnage.dart';

class Themechanger extends ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get getTheme => _themeMode;

   setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
