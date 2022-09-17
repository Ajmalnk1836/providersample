import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Authprovider extends ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  bool _isloading = true;
  bool get loading => _isloading;

  void itemLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    itemLoading(true);
    try {
      Response response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        itemLoading(false);
        log("Successfull");
      } else {
        log("unsuccessful");
        itemLoading(false);
      }
    } catch (e) {
      itemLoading(false);
      print(e.toString());
    }
  }
}
