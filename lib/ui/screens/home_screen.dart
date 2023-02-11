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
            padding: const EdgeInsetsDirectional.only(),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainerBottomNav(Icons.notifications),
                  buildContainerBottomNav(Icons.home, isSelected: true),
                  buildContainerBottomNav(Icons.person),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 250,
                color: const Color.fromARGB(255, 32, 118, 188),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      width: 250,
                      child: ElevatedButton(
                        child: const Text("Location"),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 55,
                        width: 250,
                        child: ElevatedButton(
                          child: const Text("Location"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 55,
                        width: 250,
                        child: ElevatedButton(
                          child: const Text("Location"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 55,
                        width: 250,
                        child: ElevatedButton(
                          child: const Text("Location"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 55,
                        width: 250,
                        child: ElevatedButton(
                          child: const Text("Location"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: SizedBox(
                        height: 55,
                        width: 250,
                        child: ElevatedButton(
                          child: const Text("Location"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 151, 200, 240)
              : const Color.fromARGB(255, 2, 62, 138),
          shape: BoxShape.circle),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
