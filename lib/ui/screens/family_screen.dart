import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/widgets/custom_button.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
      ),
    );
  }
}
