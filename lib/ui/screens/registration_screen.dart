import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/regi.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 250,
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
            const Text(
                "Create your account . It's free and only takes a minute"),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First name',
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last name',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Gender',
                    ),
                  ),
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'mail@user.com',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Password"),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Confirm Password",
                  hintText: "Enter Password"),
            ),
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  color: const Color.fromARGB(255, 32, 118, 188),
                ),
                const Text('I accept  the terms of use & privacy '),
              ],
            ),
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () {},
            ),
            const Text('Already a user ? Login ')
          ],
        ),
      ),
    );
  }
}
