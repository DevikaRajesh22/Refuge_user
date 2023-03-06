import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_radio_buttton.dart';

class ReporthazardScreen extends StatelessWidget {
  const ReporthazardScreen({super.key});

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
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hazard Report Form',
                      style: GoogleFonts.inriaSans(
                          fontSize: 23,
                          color: const Color.fromARGB(255, 140, 140, 140),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                'Location of the\nhazard',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 16.8,
                                    color: const Color.fromARGB(
                                        255, 166, 162, 162),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 45,
                          ),
                          Container(
                              height: 30,
                              width: 180,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 217, 217, 217),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 0)
                                  ]))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Date of event',
                              style: GoogleFonts.inriaSans(
                                  fontSize: 16.8,
                                  color:
                                      const Color.fromARGB(255, 166, 162, 162),
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 45,
                            width: 58,
                          ),
                          Container(
                              height: 30,
                              width: 180,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 217, 217, 217),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 0)
                                  ]))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Choose Hazard',
                              style: GoogleFonts.inriaSans(
                                  fontSize: 16.8,
                                  color:
                                      const Color.fromARGB(255, 166, 162, 162),
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 45,
                            width: 49,
                          ),
                          Container(
                            height: 30,
                            width: 180,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 217, 217, 217),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 0)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Children on site',
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Senior citizens\n on site',
                            style: GoogleFonts.inriaSans(
                                fontSize: 16.8,
                                color: const Color.fromARGB(255, 166, 162, 162),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Injured citizens',
                            style: GoogleFonts.inriaSans(
                                fontSize: 16.8,
                                color: const Color.fromARGB(255, 166, 162, 162),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 7,
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: Container(
                        height: 38,
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: ElevatedButton(
                          child: const Text("Submit"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
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
