import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/screens/home_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/util/value_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../blocs/auth/sign_in/sign_in_bloc.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isStayCalmMessageVisible = true;
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  bool isObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onFocusChanged);
    _passwordFocusNode.addListener(_onFocusChanged);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
      setState(() {
        _isStayCalmMessageVisible = false;
      });
    } else {
      setState(() {
        _isStayCalmMessageVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(),
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInFailureState) {
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(
                  title: 'Failed',
                  message:
                      'Please check your email and password and try again.',
                  primaryButtonLabel: 'Ok',
                ),
              );
            } else if (state is SignInSuccessState) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      if (_isStayCalmMessageVisible) StayCalmMessage(),
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
                      TextFormField(
                        focusNode: _emailFocusNode,
                        controller: _emailC,
                        validator: emailValidator,
                        decoration: const InputDecoration(
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
                      TextFormField(
                        controller: _passC,
                        focusNode: _passwordFocusNode,
                        validator: passwordValidator,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              isObscure = !isObscure;
                              setState(() {});
                            },
                            icon: Icon(isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        isLoading: state is SignInLoadingState,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignInBloc>(context).add(
                              SignInEvent(
                                email: _emailC.text.trim(),
                                password: _passC.text.trim(),
                              ),
                            );
                          }
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
          },
        ),
      ),
    );
  }
}

class StayCalmMessage extends StatelessWidget {
  const StayCalmMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Dont worry, help is on the way. Add you family mambers to be found by Govt. or NGOs, Request emergency services or Report Hazard. Stay informed with our notifications.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
