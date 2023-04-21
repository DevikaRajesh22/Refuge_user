part of 'manage_disasters_bloc.dart';

@immutable
abstract class ManageDisastersEvent {}

class GetAllDisasterEvent extends ManageDisastersEvent {
  final String? query;

  GetAllDisasterEvent({this.query});
}

class AddDisasterEvent extends ManageDisastersEvent {
  final String name;

  AddDisasterEvent({required this.name});
}

class EditDisasterEvent extends ManageDisastersEvent {
  final String name;
  final int disasterId;

  EditDisasterEvent({
    required this.name,
    required this.disasterId,
  });
}

class DeleteDisasterEvent extends ManageDisastersEvent {
  final int disasterId;

  DeleteDisasterEvent({required this.disasterId});
}
