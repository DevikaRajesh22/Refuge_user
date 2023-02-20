import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/Home_screen.dart';
import 'package:refuge_user/ui/screens/emerge_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmergeScreen(),
    );
  }
}
