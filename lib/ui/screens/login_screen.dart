import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Container(
          width: 400,
          height: 250,
          color: Colors.blue,
        ),
        const Text("REFUGE",
            style: TextStyle(color: Colors.blue, fontSize: 24)),
        // ignore: prefer_const_constructors
        Padding(
            padding: const EdgeInsets.all(15),
            child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "mail@user.com"))),
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(15),
          // ignore: prefer_const_constructors
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter Password"),
          ),
        )
      ],
    )));
  }
}
