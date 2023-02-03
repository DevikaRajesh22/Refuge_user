import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: const Color.fromARGB(255, 2, 62, 138),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: Row(
              children: const [
                Icon(Icons.notifications),
                Icon(Icons.home),
                Icon(Icons.person)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
