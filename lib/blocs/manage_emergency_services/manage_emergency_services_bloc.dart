import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_emergency_services_event.dart';
part 'manage_emergency_services_state.dart';

class ManageEmergencyServicesBloc
    extends Bloc<ManageEmergencyServicesEvent, ManageEmergencyServicesState> {
  ManageEmergencyServicesBloc() : super(ManageEmergencyServicesInitialState()) {
    on<ManageEmergencyServicesEvent>((event, emit) async {
      emit(ManageEmergencyServicesLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable =
          supabaseClient.from('emergency_services');
      try {
        if (event is GetAllEmergencyServiceEvent) {
          List<dynamic> temp = [];

          if (event.query != null) {
            temp = await queryTable
                .select('*')
                .ilike('name', '%${event.query}%')
                .order('name', ascending: true);
          } else {
            temp = await queryTable.select('*').order('name', ascending: true);
          }

          List<Map<String, dynamic>> services =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(
            ManageEmergencyServicesSuccessState(
              services: services,
            ),
          );
        } else if (event is AddEmergencyServiceEvent) {
          await queryTable.insert(
            {
              'name': event.name,
            },
          );

          add(GetAllEmergencyServiceEvent());
        } else if (event is EditEmergencyServiceEvent) {
          await queryTable.update({
            'name': event.name,
          }).eq('id', event.serviceId);
          add(GetAllEmergencyServiceEvent());
        } else if (event is DeleteEmergencyServiceEvent) {
          await queryTable.delete().eq('id', event.serviceId);
          add(GetAllEmergencyServiceEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(ManageEmergencyServicesFailureState());
      }
    });
  }
}
