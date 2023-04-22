part of 'manage_emergency_services_bloc.dart';

@immutable
abstract class ManageEmergencyServicesState {}

class ManageEmergencyServicesInitialState
    extends ManageEmergencyServicesState {}

class ManageEmergencyServicesLoadingState
    extends ManageEmergencyServicesState {}

class ManageEmergencyServicesSuccessState extends ManageEmergencyServicesState {
  final List<dynamic> services;

  ManageEmergencyServicesSuccessState({required this.services});
}

class ManageEmergencyServicesFailureState extends ManageEmergencyServicesState {
  final String message;

  ManageEmergencyServicesFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
