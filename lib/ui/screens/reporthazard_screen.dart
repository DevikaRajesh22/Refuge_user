import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    Text(
                      'Hazard Report Form',
                      style: GoogleFonts.inriaSans(
                          fontSize: 23,
                          color: const Color.fromARGB(255, 140, 140, 140),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Location of the\nhazard',
                              style: GoogleFonts.inriaSans(
                                  fontSize: 16.8,
                                  color:
                                      const Color.fromARGB(255, 166, 162, 162),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('Date of event',
                            style: GoogleFonts.inriaSans(
                                fontSize: 16.8,
                                color: const Color.fromARGB(255, 166, 162, 162),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('Choose Hazard',
                            style: GoogleFonts.inriaSans(
                                fontSize: 16.8,
                                color: const Color.fromARGB(255, 166, 162, 162),
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
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
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
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Senior citizens\n on site',
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
                          'Injured citizens',
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

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onPressed;
  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(label),
      ],
    );
  }
}
