import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/viewmodel/themechangerprovider/themechnagerProvider.dart';
import 'package:provider/provider.dart';

class Thememode extends StatefulWidget {
  const Thememode({Key? key}) : super(key: key);

  @override
  State<Thememode> createState() => _ThememodeState();
}

class _ThememodeState extends State<Thememode> {
  @override
  Widget build(BuildContext context) {
    final thememode = Provider.of<Themechanger>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Light theme"),
            value:ThemeMode.light , 
            groupValue: thememode.getTheme ,
             onChanged: (value) {
              thememode.setTheme(ThemeMode.light);
               
             },
             ),
             RadioListTile<ThemeMode>(
            title: Text("Dark theme"),
            value:ThemeMode.dark , 
            groupValue: thememode.getTheme ,
             onChanged: (value) {
              thememode.setTheme(ThemeMode.dark);
               
             },
             ),
             RadioListTile<ThemeMode>(
            title: Text("Sysytem theme"),
            value:ThemeMode.system , 
            groupValue: thememode.getTheme ,
             onChanged: (value) {
              thememode.setTheme(ThemeMode.system);
               
             },
             ),

          
        ],
      )),
    );
  }
}
