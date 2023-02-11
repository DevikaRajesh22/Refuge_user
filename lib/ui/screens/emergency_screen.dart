import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

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
                color: const Color.fromARGB(255, 139, 177, 208),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                        width: 180,
                        height: 100,
                        color: const Color.fromARGB(255, 55, 124, 180)),
                    Container(
                        width: 180,
                        height: 100,
                        color: const Color.fromARGB(255, 79, 158, 222))
                  ],
                ),
              )
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
