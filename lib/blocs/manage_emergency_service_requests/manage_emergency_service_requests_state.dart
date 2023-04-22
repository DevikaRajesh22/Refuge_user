part of 'manage_emergency_service_requests_bloc.dart';

@immutable
abstract class ManageEmergencyServiceRequestsState {}

class ManageEmergencyServiceRequestInitialState
    extends ManageEmergencyServiceRequestsState {}

class ManageEmergencyServiceRequestSuccessState
    extends ManageEmergencyServiceRequestsState {
  final List<Map<String, dynamic>> serviceRequests;

  ManageEmergencyServiceRequestSuccessState({required this.serviceRequests});
}

class ManageEmergencyServiceRequestLoadingState
    extends ManageEmergencyServiceRequestsState {}

class ManageEmergencyServiceRequestFailureState
    extends ManageEmergencyServiceRequestsState {
  final String message;

  ManageEmergencyServiceRequestFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
