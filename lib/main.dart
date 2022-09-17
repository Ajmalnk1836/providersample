import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/view/homepage/home.dart';
import 'package:mvvmwithprovider/viewmodel/favouratecontrooler/favouratescreenprovider.dart';
import 'package:mvvmwithprovider/viewmodel/homepage/homecontroller.dart';
import 'package:mvvmwithprovider/viewmodel/themechangerprovider/themechnagerProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => favouratescreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => Themechanger(),
        ),
      ],
      child: Builder(builder: (context) {
        final provider = Provider.of<Themechanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.getTheme,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const Homescreen(),
        );
      }),
    );
  }
}
