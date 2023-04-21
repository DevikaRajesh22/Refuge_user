import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());

      SupabaseClient supabaseClient = Supabase.instance.client;

      try {
        if (event is CreateUserEvent) {
          UserResponse res = await supabaseClient.auth.admin.createUser(
            AdminUserAttributes(
              email: event.email,
              password: event.password,
              emailConfirm: true,
            ),
          );

          if (res.user != null) {
            await supabaseClient.auth.signInWithPassword(
              email: event.email,
              password: event.password,
            );
            emit(SignUpSuccessState());
          } else {
            emit(SignUpFailureState());
          }
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(SignUpFailureState(message: e.toString()));
      }
    });
  }
}
