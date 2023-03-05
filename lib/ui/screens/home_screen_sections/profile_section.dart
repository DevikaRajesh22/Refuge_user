import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(225, 2, 62, 138),
          ),
          Container(
            height: 650,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/face.png',
                    alignment: Alignment.topCenter,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mark Alexander',
                    style: GoogleFonts.inriaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Manchester ,UK',
                    style: GoogleFonts.inriaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 77, 77, 77)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Camp Location : Yida, South Sudan',
                    style: GoogleFonts.inriaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Camp Id: 978',
                    style: GoogleFonts.inriaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Refugee Id: 586392',
                    style: GoogleFonts.inriaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Family Members: 5',
                    style: GoogleFonts.inriaSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Container(
                      height: 38,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ElevatedButton(
                        child: const Text("Logout"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
