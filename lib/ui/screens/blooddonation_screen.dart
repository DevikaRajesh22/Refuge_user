import 'package:flutter/material.dart';

class BlooddonationScreeen extends StatelessWidget {
  const BlooddonationScreeen({super.key});

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
              Stack(children: [
                Container(
                  height: 250,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 12)
                      ]),
                ),
                Image.asset(
                  'assets/images/blooddonation.png',
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                ),
              ]),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
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
