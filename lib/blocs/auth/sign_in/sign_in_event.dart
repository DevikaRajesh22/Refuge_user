part of 'sign_in_bloc.dart';

class SignInEvent {
  final String email, password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}
