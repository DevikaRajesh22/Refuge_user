import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Column(children: [
      Container(
        height: 250,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)],
        ),
        child: Image.asset(
          'assets/images/regi1.png',
          height: 250,
          width: 400,
          alignment: Alignment.center,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text("REFUGE", style: TextStyle(color: Colors.blue, fontSize: 24)),
      // ignore: prefer_const_constructors
      Padding(
          padding: const EdgeInsets.all(15),
          child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "mail@user.com"))),

      const Padding(
        padding: EdgeInsets.all(15),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
              hintText: "Enter Password"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(35),
        child: Container(
          height: 38,
          width: 300,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ElevatedButton(
            child: const Text("Login"),
            onPressed: () {},
          ),
        ),
      ),

      const Padding(padding: EdgeInsets.all(1)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Forgot your login details ? "),
          Text(
            " Get help signing in . ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(
        height: 50,
      ),

      const SizedBox(
        height: 10,
      ),
      Text("Don’t have an account?  Sign Up",
          style: GoogleFonts.inriaSans(
              fontSize: 16, color: const Color.fromARGB(255, 75, 103, 243)))
    ]))));
  }
}
