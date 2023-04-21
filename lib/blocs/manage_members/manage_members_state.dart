part of 'manage_members_bloc.dart';

@immutable
abstract class ManageMembersState {}

class ManageMembersInitialState extends ManageMembersState {}

class ManageMembersLoadingState extends ManageMembersState {}

class ManageMembersSuccessState extends ManageMembersState {
  final List<Map<String, dynamic>> members;

  ManageMembersSuccessState({required this.members});
}

class ManageMembersFailureState extends ManageMembersState {
  final String message;

  ManageMembersFailureState({
    this.message =
        'Something went wrong, Please check your connection and try again!.',
  });
}
