import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(SignInLoadingState());

      try {
        await Supabase.instance.client.auth.signInWithPassword(
          email: event.email,
          password: event.password,
        );

        emit(SignInSuccessState());
      } catch (e, s) {
        log("$e\n$s");
        emit(SignInFailureState());
      }
    });
  }
}
