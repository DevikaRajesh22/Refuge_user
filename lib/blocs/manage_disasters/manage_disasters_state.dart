part of 'manage_disasters_bloc.dart';

@immutable
abstract class ManageDisastersState {}

class ManageDisastersInitialState extends ManageDisastersState {}

class ManageDisastersLoadingState extends ManageDisastersState {}

class ManageDisastersSuccessState extends ManageDisastersState {
  final List<Map<String, dynamic>> disasters;

  ManageDisastersSuccessState({required this.disasters});
}

class ManageDisastersFailureState extends ManageDisastersState {
  final String message;

  ManageDisastersFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
