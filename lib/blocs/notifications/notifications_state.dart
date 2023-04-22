part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitialState extends NotificationsState {}

class NotificationsSuccessState extends NotificationsState {
  final List<Map<String, dynamic>> notifications;

  NotificationsSuccessState({required this.notifications});
}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsFailureState extends NotificationsState {
  final String message;

  NotificationsFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
