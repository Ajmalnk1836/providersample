import 'package:flutter/cupertino.dart';

class NotifyLisnter extends ChangeNotifier {
  ValueNotifier<bool> visibility = ValueNotifier<bool>(false);

  void showOtp(bool status) {
    visibility.value = status;
    notifyListeners();
  }

  bool _showotp = true;
  bool get showotp => _showotp;

  void optShow(bool status) {
    _showotp = !status;
    notifyListeners();
  }
}
