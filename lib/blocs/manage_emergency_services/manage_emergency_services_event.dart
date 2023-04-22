part of 'manage_emergency_services_bloc.dart';

@immutable
abstract class ManageEmergencyServicesEvent {}

class GetAllEmergencyServiceEvent extends ManageEmergencyServicesEvent {
  final String? query;

  GetAllEmergencyServiceEvent({this.query});
}

class AddEmergencyServiceEvent extends ManageEmergencyServicesEvent {
  final String name;

  AddEmergencyServiceEvent({required this.name});
}

class EditEmergencyServiceEvent extends ManageEmergencyServicesEvent {
  final String name;
  final int serviceId;

  EditEmergencyServiceEvent({
    required this.name,
    required this.serviceId,
  });
}

class DeleteEmergencyServiceEvent extends ManageEmergencyServicesEvent {
  final int serviceId;

  DeleteEmergencyServiceEvent({required this.serviceId});
}
