part of 'manage_hazards_bloc.dart';

@immutable
abstract class ManageHazardsState {}

class ManageHazardsInitialState extends ManageHazardsState {}

class ManageHazardsSuccessState extends ManageHazardsState {
  final List<Map<String, dynamic>> hazards;

  ManageHazardsSuccessState({required this.hazards});
}

class ManageHazardsLoadingState extends ManageHazardsState {}

class ManageHazardsFailureState extends ManageHazardsState {
  final String message;

  ManageHazardsFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
