import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_radio_buttton.dart';

class CareTeamScreen extends StatelessWidget {
  const CareTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(225, 2, 62, 138),
          ),
          Container(
            height: 620,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Choose your option:',
                      style: GoogleFonts.inriaSans(
                          fontSize: 23,
                          color: const Color.fromARGB(255, 140, 140, 140),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Text(
                          'Pediatrics',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: 'Yes',
                                onPressed: () {},
                                isSelected: true,
                              ),
                              CustomRadioButton(
                                label: 'No',
                                onPressed: () {},
                                isSelected: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Cardiology',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: 'Yes',
                                onPressed: () {},
                                isSelected: true,
                              ),
                              CustomRadioButton(
                                label: 'No',
                                onPressed: () {},
                                isSelected: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Gastroenterology',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: 'Yes',
                                onPressed: () {},
                                isSelected: true,
                              ),
                              CustomRadioButton(
                                label: 'No',
                                onPressed: () {},
                                isSelected: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rehabilitation',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: 'Yes',
                                onPressed: () {},
                                isSelected: true,
                              ),
                              CustomRadioButton(
                                label: 'No',
                                onPressed: () {},
                                isSelected: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Gynaecology',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 37,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: 'Yes',
                                onPressed: () {},
                                isSelected: true,
                              ),
                              CustomRadioButton(
                                label: 'No',
                                onPressed: () {},
                                isSelected: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: Container(
                        height: 38,
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ElevatedButton(
                          child: const Text("Submit"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
