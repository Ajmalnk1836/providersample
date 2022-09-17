import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmwithprovider/view/favourateliatscreen/favouratelist.dart';
import 'package:mvvmwithprovider/view/themechnager/themechnage.dart';
import 'package:mvvmwithprovider/viewmodel/favouratecontrooler/favouratescreenprovider.dart';
import 'package:mvvmwithprovider/viewmodel/themechangerprovider/themechnagerProvider.dart';
import 'package:provider/provider.dart';

class fvaouratescreen extends StatefulWidget {
  fvaouratescreen({Key? key}) : super(key: key);

  @override
  State<fvaouratescreen> createState() => _fvaouratescreenState();
}

class _fvaouratescreenState extends State<fvaouratescreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<favouratescreen>(context, listen: false);
    log("message");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Listfavourate(),
                  ));
            },
            icon: Icon(Icons.favorite)),
        centerTitle: true,
        title: Consumer<favouratescreen>(
            builder: (context, value, child) =>
                Text(provider.list.length.toString())),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return const Thememode();
                    },));
                  }, icon: Icon(Icons.theater_comedy))
                ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, index) {
                    return Consumer<favouratescreen>(
                      builder: (context, value, child) => ListTile(
                        leading: Text("Item Name $index"),
                        trailing: IconButton(
                            onPressed: () {
                              if (provider.list.contains(index)) {
                                provider.removeItem(index);
                              } else {
                                provider.addItem(index);
                              }
                            },
                            icon: provider.list.contains(index)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  )),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, index) {
                    return const Divider();
                  },
                  itemCount: 30))
        ],
      )),
    );
  }
}
