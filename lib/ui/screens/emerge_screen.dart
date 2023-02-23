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
          child: Column(
        children: [
          Container(
            height: 250,
            width: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Image.asset(
              'assets/images/light.png',
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 160,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/blood.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Blood Donation')
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 120,
                width: 160,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/camera.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Report Hazard')
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 160,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/hand.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Care Team')
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 120,
                width: 160,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/van.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Emergency Servies')
                  ],
                ),
              ),
            ],
          ),
        ],
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
