import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());

      try {
        //supabase code
        await Supabase.instance.client.auth.signUp(
          email: event.email,
          password: event.password,
        );

        emit(SignUpSuccessState());
      } catch (e, s) {
        log('$e\n$s');
        emit(SignUpFailureState());
      }
    });
  }
}
