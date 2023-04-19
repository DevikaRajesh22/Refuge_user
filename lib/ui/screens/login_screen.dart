import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/screens/home_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 0,
                color: Colors.blue[50],
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.groups,
                          size: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Stay Calm',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Dont worry, help is on the way. Add you family mambers to be found by Govt. or NGOs, Request emergency services or Report Hazard. Stay informed with our notifications.',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: "mail@user.com",
                  prefixIcon: Icon(
                    Icons.mail,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                label: 'LOGIN',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Don’t have an account?",
                style: GoogleFonts.inriaSans(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                label: 'REGISTER',
                color: Colors.blue[50],
                labelColor: Colors.blue[900],
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
