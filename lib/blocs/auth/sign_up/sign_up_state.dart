part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {}
