import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/complaints_screen.dart';
import 'package:refuge_user/ui/screens/emergency_screen.dart';
import 'package:refuge_user/ui/screens/hazards_screen.dart';
import 'package:refuge_user/ui/screens/home_screen.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/dashboard_section.dart';
import 'package:refuge_user/ui/screens/login_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/ui/screens/splash_screen.dart';
import 'package:refuge_user/ui/screens/suggestions_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://rzzdxjmkaxuntlgyfvee.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6emR4am1rYXh1bnRsZ3lmdmVlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NzkyMDIwMCwiZXhwIjoxOTkzNDk2MjAwfQ.ZMsBMjD2DKsIHe0MDdjOr6iNhfWZ34l3tHP3rUqLeHY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.blue[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            iconColor: Colors.blue[900],
            prefixIconColor: Colors.blue[900],
            suffixIconColor: Colors.blue[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
