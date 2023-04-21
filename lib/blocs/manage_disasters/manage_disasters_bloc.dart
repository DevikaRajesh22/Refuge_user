import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_disasters_event.dart';
part 'manage_disasters_state.dart';

class ManageDisastersBloc
    extends Bloc<ManageDisastersEvent, ManageDisastersState> {
  ManageDisastersBloc() : super(ManageDisastersInitialState()) {
    on<ManageDisastersEvent>((event, emit) async {
      emit(ManageDisastersLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('disasters');
      try {
        if (event is GetAllDisasterEvent) {
          List<dynamic> temp = [];

          if (event.query != null) {
            temp = await queryTable
                .select('*')
                .ilike('name', '%${event.query}%')
                .order('name', ascending: true);
          } else {
            temp = await queryTable.select('*').order('name', ascending: true);
          }

          List<Map<String, dynamic>> disasters =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(
            ManageDisastersSuccessState(
              disasters: disasters,
            ),
          );
        } else if (event is AddDisasterEvent) {
          await queryTable.insert(
            {
              'name': event.name,
            },
          );

          add(GetAllDisasterEvent());
        } else if (event is EditDisasterEvent) {
          await queryTable.update({
            'name': event.name,
          }).eq('id', event.disasterId);
          add(GetAllDisasterEvent());
        } else if (event is DeleteDisasterEvent) {
          await queryTable.delete().eq('id', event.disasterId);
          add(GetAllDisasterEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(ManageDisastersFailureState());
      }
    });
  }
}
