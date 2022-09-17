import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmwithprovider/view/favouratescreen/favouratescrren.dart';
import 'package:mvvmwithprovider/viewmodel/favouratecontrooler/favouratescreenprovider.dart';
import 'package:mvvmwithprovider/viewmodel/homepage/homecontroller.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Homecontroller>(context, listen: false);
    log("widget changed");
    return Scaffold(
      body: SafeArea(
          child: Consumer<Homecontroller>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              color: Colors.red.withOpacity(provider.value),
            )),
            Expanded(
                child: Container(
              color: Colors.green.withOpacity(provider.value),
            )),
            const SizedBox(
              height: 80,
            ),
            Slider(
              value: provider.value,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                provider.chnageColor(value);
                log(value.toString());
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  fvaouratescreen();
                  }));
                },
                child: const Text("Go to fsvourate screen"))
          ],
        ),
      )),
    );
  }
}
