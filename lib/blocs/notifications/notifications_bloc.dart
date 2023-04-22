import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitialState()) {
    on<NotificationsEvent>((event, emit) async {
      emit(NotificationsLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('notifications');
      try {
        if (event is GetAllNotificationsEvent) {
          List<dynamic> temp = await queryTable.select().order(
                'created_at',
              );

          List<Map<String, dynamic>> notifications =
              temp.map((e) => e as Map<String, dynamic>).toList();

          emit(
            NotificationsSuccessState(
              notifications: notifications,
            ),
          );
        } else if (event is AddNotificationsEvent) {
          await queryTable.insert(
            {
              'user_id': supabaseClient.auth.currentUser!.id,
              'notification': event.notification,
            },
          );

          add(GetAllNotificationsEvent());
        } else if (event is DeleteNotificationsEvent) {
          await queryTable.delete().eq('id', event.notificationId);
          add(GetAllNotificationsEvent());
        }
      } catch (e, s) {
        Logger().wtf('$e,$s');
        emit(NotificationsFailureState());
      }
    });
  }
}
