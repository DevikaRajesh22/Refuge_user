import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlooddonationScreeen extends StatelessWidget {
  const BlooddonationScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)]),
            ),
            Image.asset(
              'assets/images/blooddonation.png',
              height: 300,
              width: 300,
              alignment: Alignment.center,
            ),
          ]),
          Container(
            height: 67,
            width: 370,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              children: [
                Text(
                  'Name 1',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inriaSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text(
                  'Today 10.09 am',
                  style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text('Contact no:7568954825',
                    style: GoogleFonts.inriaSans(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 107, 105, 105)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 67,
            width: 370,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              children: [
                Text(
                  'Name 1',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inriaSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text(
                  'Today 10.09 am',
                  style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text('Contact no:7568954825',
                    style: GoogleFonts.inriaSans(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 107, 105, 105)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 67,
            width: 370,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              children: [
                Text(
                  'Name 1',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inriaSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text(
                  'Today 10.09 am',
                  style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text('Contact no:7568954825',
                    style: GoogleFonts.inriaSans(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 107, 105, 105)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 67,
            width: 370,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              children: [
                Text(
                  'Name 1',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inriaSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text(
                  'Today 10.09 am',
                  style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text('Contact no:7568954825',
                    style: GoogleFonts.inriaSans(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 107, 105, 105)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 67,
            width: 370,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
            child: Column(
              children: [
                Text(
                  'Name 1',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inriaSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text(
                  'Today 10.09 am',
                  style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 107, 105, 105)),
                ),
                Text('Contact no:7568954825',
                    style: GoogleFonts.inriaSans(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 107, 105, 105)))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
