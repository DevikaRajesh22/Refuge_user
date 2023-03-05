import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_radio_buttton.dart';

class EmergencyServiceScreen extends StatelessWidget {
  const EmergencyServiceScreen({super.key});

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
                      'Choose your emergency:',
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
                          'Water service',
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
                          'Food services',
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
                          'Sanitary services',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 28,
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
                          'Fire department',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 31,
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
                          'Police department',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 21,
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
                          'Others',
                          style: GoogleFonts.inriaSans(
                              fontSize: 16.8,
                              color: const Color.fromARGB(255, 166, 162, 162),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 111,
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
