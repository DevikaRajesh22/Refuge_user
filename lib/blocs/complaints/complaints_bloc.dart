import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'complaints_event.dart';
part 'complaints_state.dart';

class ComplaintsBloc extends Bloc<ComplaintsEvent, ComplaintsState> {
  ComplaintsBloc() : super(ComplaintsInitialState()) {
    on<ComplaintsEvent>((event, emit) async {
      emit(ComplaintsLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('complaints');
      try {
        if (event is GetAllComplaintsEvent) {
          List<dynamic> temp = await queryTable.select().order(
                'created_at',
              );

          List<Map<String, dynamic>> complaints =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(
            ComplaintsSuccessState(
              complaints: complaints,
            ),
          );
        } else if (event is AddComplaintsEvent) {
          await queryTable.insert(
            {
              'user_id': supabaseClient.auth.currentUser!.id,
              'complaint': event.complaint,
            },
          );

          add(GetAllComplaintsEvent());
        } else if (event is DeleteComplaintsEvent) {
          await queryTable.delete().eq('id', event.complaintId);
          add(GetAllComplaintsEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(ComplaintsFailureState());
      }
    });
  }
}
