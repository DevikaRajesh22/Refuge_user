import 'package:flutter/material.dart';

class EmergeScreen extends StatelessWidget {
  const EmergeScreen({super.key});

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
          child: Container(
        height: 250,
        width: 500,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      )),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 2, 62, 138)
              : const Color.fromARGB(255, 2, 62, 138),
          shape: BoxShape.circle),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
