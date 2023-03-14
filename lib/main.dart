import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/blooddonation_screen.dart';
import 'package:refuge_user/ui/screens/careteam_screen.dart';
import 'package:refuge_user/ui/screens/family_screen.dart';
import 'package:refuge_user/ui/screens/home_screen.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/dashboard_section.dart';
import 'package:refuge_user/ui/screens/login_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/ui/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://rzzdxjmkaxuntlgyfvee.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6emR4am1rYXh1bnRsZ3lmdmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzc5MjAyMDAsImV4cCI6MTk5MzQ5NjIwMH0.K9Ft1UfmujghFL-8wUo3QppOxl8o_90qg5ZRjwfW_xE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationScreen(),
    );
  }
}
