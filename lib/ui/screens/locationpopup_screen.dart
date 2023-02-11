import 'package:flutter/material.dart';

class LocationpopupScreen extends StatelessWidget {
  const LocationpopupScreen({super.key});

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
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 151, 200, 240)
              : Color.fromARGB(255, 228, 218, 218),
          shape: BoxShape.circle),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
