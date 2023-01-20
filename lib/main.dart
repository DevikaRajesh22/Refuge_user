import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/login_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/ui/screens/splash_screen.dart';

void main() {
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
