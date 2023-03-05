import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text('Rate Refuge',
                    style: GoogleFonts.inriaSans(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 0, 0, 0))),
                Padding(
                  padding: const EdgeInsets.all(50),
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
                        height: 60,
                      ),
                      SizedBox(
                          height: 120,
                          width: 270,
                          child: Material(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: const Color.fromARGB(255, 228, 229, 230),
                            child: Text('Type your review....',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 150, 147, 147))),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: .5,
                ),
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Container(
                    height: 38,
                    width: 300,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: ElevatedButton(
                      child: const Text("Rate"),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
