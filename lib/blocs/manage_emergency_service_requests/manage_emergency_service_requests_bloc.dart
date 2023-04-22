import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_emergency_service_requests_event.dart';
part 'manage_emergency_service_requests_state.dart';

class ManageEmergencyServiceRequestsBloc extends Bloc<
    ManageEmergencyServiceRequestsEvent, ManageEmergencyServiceRequestsState> {
  ManageEmergencyServiceRequestsBloc()
      : super(ManageEmergencyServiceRequestInitialState()) {
    on<ManageEmergencyServiceRequestsEvent>((event, emit) async {
      emit(ManageEmergencyServiceRequestLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable =
          supabaseClient.from('emergency_service_requests');
      try {
        if (event is GetAllEmergencyServiceRequestsEvent) {
          List<dynamic> temp = await queryTable.select().order(
                'created_at',
              );

          List<Map<String, dynamic>> serviceRequests =
              temp.map((e) => e as Map<String, dynamic>).toList();

          for (int i = 0; i < serviceRequests.length; i++) {
            serviceRequests[i]['refugee'] = await supabaseClient
                .from('refugees')
                .select('*')
                .eq('id', serviceRequests[i]['refugee_id'])
                .maybeSingle();
            serviceRequests[i]['service'] = await supabaseClient
                .from('emergency_services')
                .select('*')
                .eq('id', serviceRequests[i]['emergency_service_id'])
                .maybeSingle();

            if (serviceRequests[i]['accepted_by'] != null) {
              serviceRequests[i]['accepted_by_details'] = await supabaseClient
                  .from('ngos')
                  .select('*')
                  .eq('user_id', serviceRequests[i]['accepted_by'])
                  .maybeSingle();
            }
          }

          Logger().w(serviceRequests);

          emit(
            ManageEmergencyServiceRequestSuccessState(
              serviceRequests: serviceRequests,
            ),
          );
        } else if (event is AddEmergencyServiceRequestEvent) {
          await queryTable.insert(
            {
              'user_id': supabaseClient.auth.currentUser!.id,
              'remarks': event.remarks,
              'emergency_service_id': event.serviceId,
              'refugee_id': event.memberId,
            },
          );

          add(GetAllEmergencyServiceRequestsEvent());
        } else if (event is DeleteEmergencyServiceRequestEvent) {
          await queryTable.delete().eq('id', event.serviceRequestId);
          add(GetAllEmergencyServiceRequestsEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(ManageEmergencyServiceRequestFailureState());
      }
    });
  }
}
