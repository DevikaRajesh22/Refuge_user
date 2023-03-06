import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/add_screen.dart';
import 'package:refuge_user/ui/screens/careteam_screen.dart';
import 'package:refuge_user/ui/screens/emergencyservices_screen.dart';
import 'package:refuge_user/ui/screens/family_screen.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/profile_section.dart';
import 'package:refuge_user/ui/screens/reporthazard_screen.dart';
import 'package:refuge_user/ui/screens/review_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReporthazardScreen(),
    );
  }
}
