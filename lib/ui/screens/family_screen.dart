import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/widgets/custom_button.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 12)]),
              child: Image.asset(
                'assets/images/fam1.png',
                height: 600,
                width: 900,
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 65,
                    child: Material(
                      elevation: 4,
                      color: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 5, 27, 70),
                          width: 0.0001,
                        ),
                      ),
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('ADD'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Accordion(
                    maxOpenSections: 1,
                    headerBackgroundColorOpened: Colors.black54,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                    children: [
                      AccordionSection(
                        isOpen: true,
                        headerBackgroundColor: Colors.blue[600],
                        headerBackgroundColorOpened: Colors.blue[400],
                        header: const Text(
                          " John Mathews",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),

                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(" Refugee ID: 331-670"),
                            Text(" Camp Number : 236"),
                            Text(" Aadhaar Number : XXXXXXXX5641"),
                            Text("Age : 30 "),
                            Text("Blood Group : B +ve "),
                            Text(
                                "Identification Mark : Mole on right forearm , \nBirth mark on chin"),
                          ],
                        ),
                        contentHorizontalPadding: 20,
                        contentBorderWidth: 1,
                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                    ],
                  ),
                  Accordion(
                    maxOpenSections: 1,
                    headerBackgroundColorOpened: Colors.black54,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                    children: [
                      AccordionSection(
                        isOpen: true,
                        headerBackgroundColor: Colors.blue[600],
                        headerBackgroundColorOpened: Colors.blue[400],
                        header: const Text(
                          " Marry John Mathews",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),

                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(" Refugee ID: 331-671"),
                            Text(" Camp Number : 236"),
                            Text(" Aadhaar Number : XXXXXXXX5642"),
                            Text("Age : 29 "),
                            Text("Blood Group : B +ve "),
                            Text(
                                "Identification Mark : Mole on left forearm , \nBirth mark on ear"),
                          ],
                        ),
                        contentHorizontalPadding: 20,
                        contentBorderWidth: 1,
                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                    ],
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
