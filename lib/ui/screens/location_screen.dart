import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                  width: 500,
                  height: 250,
                  color: const Color.fromARGB(255, 32, 118, 188)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Whats your Risk Level?',
              style: GoogleFonts.inriaSans(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 3, 4, 85),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: CustomButton(
                      label: 'High Risk Area',
                      onTap: () {},
                      riskLevelColor: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: CustomButton(
                      label: 'Medium Risk Area',
                      onTap: () {},
                      riskLevelColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: CustomButton(
                      label: 'Low Risk Area',
                      onTap: () {},
                      riskLevelColor: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The Risk Level Should be the one assigned by your ",
                    style: GoogleFonts.inriaSans(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 30, 30, 32),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "local authorities",
                    style: GoogleFonts.inriaSans(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 30, 30, 32),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color riskLevelColor;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.riskLevelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: const Color(0xFF0077B6),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: riskLevelColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
