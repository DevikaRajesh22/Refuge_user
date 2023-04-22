part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class CreateUserEvent extends SignUpEvent {
  final String email, password;

  CreateUserEvent({
    required this.email,
    required this.password,
  });
}
