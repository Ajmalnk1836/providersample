import 'package:flutter/material.dart';
import 'package:mvvmwithprovider/viewmodel/loginauthprovider/authprovider.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Authprovider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login with rest api "),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: provider.namecontroller,
              decoration: const InputDecoration(
                hintText: "User name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: provider.passcontroller,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () {
                    provider.login(provider.namecontroller.text.toString(),
                        provider.passcontroller.text.toString());
                  },
                  child: Center(
                      child:const Text("Login"))),
            ),
          ],   
        ),
      )),
    );
  }
}
