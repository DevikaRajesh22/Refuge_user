import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/screens/home_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../../blocs/auth/sign_up/sign_up_bloc.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _isStayCalmMessageVisible = true;

  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  final TextEditingController _cPassC = TextEditingController();

  bool isObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onFocusChanged);
    _passwordFocusNode.addListener(_onFocusChanged);
    _confirmPasswordFocusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_emailFocusNode.hasFocus ||
        _passwordFocusNode.hasFocus ||
        _confirmPasswordFocusNode.hasFocus) {
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
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(
                  title: 'Failed',
                  message:
                      'Please check your email and password and try again.',
                  primaryButtonLabel: 'Ok',
                ),
              );
            } else if (state is SignUpSuccessState) {
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
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      if (_isStayCalmMessageVisible) const StayCalmMessage(),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailC,
                        validator: emailValidator,
                        focusNode: _emailFocusNode,
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
                        validator: passwordValidator,
                        focusNode: _passwordFocusNode,
                        obscureText: isObscure,
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
                      TextFormField(
                        controller: _cPassC,
                        focusNode: _confirmPasswordFocusNode,
                        obscureText: isObscure,
                        validator: (value) {
                          return confirmPasswordValidator(
                              value, _passC.text.trim());
                        },
                        decoration: const InputDecoration(
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
                        isLoading: state is SignUpLoadingState,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpBloc>(context).add(
                              CreateUserEvent(
                                email: _emailC.text.trim(),
                                password: _passC.text.trim(),
                              ),
                            );
                          }
                        },
                        label: 'REGISTER',
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
                          Navigator.pop(context);
                        },
                        label: 'LOGIN',
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
