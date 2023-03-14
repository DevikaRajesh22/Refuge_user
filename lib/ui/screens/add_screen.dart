import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/widgets/custom_button.dart';

import '../widgets/custom_radio_buttton.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

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
                'assets/images/family.png',
                height: 600,
                width: 900,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            const Text(
              'Gender',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadioButton(
                  label: 'Female',
                  onPressed: () {},
                  isSelected: true,
                ),
                CustomRadioButton(
                  label: 'Male',
                  onPressed: () {},
                  isSelected: false,
                ),
                CustomRadioButton(
                  label: 'Others',
                  onPressed: () {},
                  isSelected: false,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Date of birth',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Photo ID Proof',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Photo ID Number',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Blood Group',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Identification Mark',
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
                  child: const Text("Save"),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
