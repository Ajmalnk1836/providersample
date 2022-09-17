import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/view/loginpart/loginscreen.dart';
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
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginscreen(),
                      ));
                },
                child: const Text("Rest api login sample with provider"))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
