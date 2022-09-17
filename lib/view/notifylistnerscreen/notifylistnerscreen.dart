import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/viewmodel/notifylisnerprovider/notifylisnerprovider.dart';
import 'package:provider/provider.dart';

class NotifylistnerScreen extends StatelessWidget {
  NotifylistnerScreen({Key? key}) : super(key: key);
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> visibility = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotifyLisnter>(context, listen: false);
    log("widget changed");
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Welcome"),
            ),
            Text(_counter.value.toString()),
            const SizedBox(
              height: 10,
            ),
            Consumer<NotifyLisnter>(
              builder: (context, value, child) => TextFormField(
                obscureText: provider.showotp,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        provider.optShow(provider.showotp);
                      },
                      icon: provider.showotp
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility)),
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
