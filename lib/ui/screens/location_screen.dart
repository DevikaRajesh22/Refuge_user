import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/widgets/custom_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
