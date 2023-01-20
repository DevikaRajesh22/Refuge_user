import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        Container(
          width: 400,
          height: 250,
          color: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(15),
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
                Text("Register"),
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
          ),
        ),
        const Text("Create your account . It's free and only takes a minute")
      ]),
    ));
  }
}
