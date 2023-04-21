import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(SuggestionInitialState()) {
    on<SuggestionEvent>((event, emit) async {
      emit(SuggestionLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('suggestions');
      try {
        if (event is GetAllSuggestionEvent) {
          List<dynamic> temp = await queryTable.select().order(
                'created_at',
              );

          List<Map<String, dynamic>> suggestions =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(
            SuggestionSuccessState(
              suggestions: suggestions,
            ),
          );
        } else if (event is AddSuggestionEvent) {
          await queryTable.insert(
            {
              'user_id': supabaseClient.auth.currentUser!.id,
              'suggestion': event.suggestion,
            },
          );

          add(GetAllSuggestionEvent());
        } else if (event is DeleteSuggestionEvent) {
          await queryTable.delete().eq('id', event.suggestionId);
          add(GetAllSuggestionEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(SuggestionFailureState());
      }
    });
  }
}
