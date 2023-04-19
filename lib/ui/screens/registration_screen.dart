import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget {
  final bool editMode;
  const RegisterScreen({
    super.key,
    this.editMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editMode
          ? AppBar(
              backgroundColor: Colors.white,
              leading: const BackButton(color: Colors.black45),
              centerTitle: false,
              elevation: 1,
              title: Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              if (!editMode)
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Dont worry, help is on the way. Add you family mambers to be found by Govt. or NGOs, Request emergency services or Report Hazard. Stay informed with our notifications.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (!editMode)
                const Expanded(
                  child: SizedBox(),
                ),
              Text(
                (!editMode) ? 'Register' : 'Edit Profile',
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
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
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
                  if (!editMode) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                label: (!editMode) ? 'REGISTER' : 'UPDATE',
              ),
              if (!editMode)
                const SizedBox(
                  height: 20,
                ),
              if (!editMode)
                Text(
                  "Already have an account?",
                  style: GoogleFonts.inriaSans(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              if (!editMode)
                const SizedBox(
                  height: 10,
                ),
              if (!editMode)
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: 'LOGIN',
                  color: Colors.blue[50],
                  labelColor: Colors.blue[900],
                ),
              if (!editMode)
                const Expanded(
                  child: SizedBox(),
                ),
              if (editMode) const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
