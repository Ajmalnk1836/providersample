import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmwithprovider/viewmodel/favouratecontrooler/favouratescreenprovider.dart';
import 'package:provider/provider.dart';

class Listfavourate extends StatelessWidget {
  const Listfavourate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<favouratescreen>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, index) => Consumer<favouratescreen>(
              builder: (context, value, child) {
                final value = provider.list[index];
                return ListTile(
                  leading: Text(value.toString()),
                );
              }
            ),
          ))
        ],
      )),
    );
  }
}
