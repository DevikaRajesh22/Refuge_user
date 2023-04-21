import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_members_event.dart';
part 'manage_members_state.dart';

class ManageMembersBloc extends Bloc<ManageMembersEvent, ManageMembersState> {
  ManageMembersBloc() : super(ManageMembersInitialState()) {
    on<ManageMembersEvent>((event, emit) async {
      emit(ManageMembersLoadingState());

      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('refugees');

      try {
        if (event is GetAllMembersEvent) {
          List<dynamic> temp = await queryTable
              .select('*')
              .eq(
                'user_id',
                supabaseClient.auth.currentUser!.id,
              )
              .order(
                'name',
                ascending: true,
              );

          List<Map<String, dynamic>> members =
              temp.map((e) => e as Map<String, dynamic>).toList();

          for (int i = 0; i < members.length; i++) {
            members[i]['disaster'] = await supabaseClient
                .from('disasters')
                .select('*')
                .eq('id', members[i]['disaster_id'])
                .maybeSingle();

            if (members[i]['camp_id'] != null) {
              members[i]['camp'] = await supabaseClient
                  .from('camps')
                  .select('*')
                  .eq('id', members[i]['camp_id'])
                  .maybeSingle();
            }
          }

          emit(ManageMembersSuccessState(members: members));
        } else if (event is AddMemberEvent) {
          await queryTable.insert({
            'user_id': supabaseClient.auth.currentUser!.id,
            'name': event.name,
            'gender': event.gender,
            'dob': event.dob,
            'disaster_id': event.disasterId,
          });
          add(GetAllMembersEvent());
        } else if (event is EditMemberEvent) {
          await queryTable.update({
            'name': event.name,
            'gender': event.gender,
            'dob': event.dob,
            'disaster_id': event.disasterId,
          }).eq('id', event.memberId);
          add(GetAllMembersEvent());
        } else if (event is DeleteMemberEvent) {
          await queryTable.delete().eq('id', event.memberId);
          add(GetAllMembersEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageMembersFailureState(message: e.toString()));
      }
    });
  }
}
