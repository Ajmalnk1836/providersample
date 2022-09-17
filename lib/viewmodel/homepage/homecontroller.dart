import 'package:flutter/cupertino.dart';

class Homecontroller extends ChangeNotifier {
  double _value = 0.0;

  double get value => _value;

  void chnageColor(double value) {
    _value = value;
    notifyListeners();
  }
}
