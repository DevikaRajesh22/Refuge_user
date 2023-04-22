part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class AddNotificationsEvent extends NotificationsEvent {
  final String notification;

  AddNotificationsEvent({
    required this.notification,
  });
}

class DeleteNotificationsEvent extends NotificationsEvent {
  final int notificationId;

  DeleteNotificationsEvent({required this.notificationId});
}

class GetAllNotificationsEvent extends NotificationsEvent {
  final String? query;

  GetAllNotificationsEvent({this.query});
}
