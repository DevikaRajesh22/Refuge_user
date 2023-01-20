import 'dart:ui';

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
        ),
        Container(
          height: 38,
          width: 300,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text("Login"),
            onPressed: () {},
          ),
        ),
        // ignore: prefer_const_constructors
        Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(
                10)), // ignore: prefer_const_literals_to_create_immutables
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text("Forgot your login details ? "),
            const Text(
              " Get help signing in . ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Color.fromARGB(255, 96, 96, 96),
                  thickness: 1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("OR"),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Divider(
                  color: Color.fromARGB(255, 96, 96, 96),
                  thickness: 1,
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
