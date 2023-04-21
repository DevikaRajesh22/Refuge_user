part of 'suggestion_bloc.dart';

@immutable
abstract class SuggestionState {}

class SuggestionInitialState extends SuggestionState {}

class SuggestionSuccessState extends SuggestionState {
  final List<Map<String, dynamic>> suggestions;

  SuggestionSuccessState({required this.suggestions});
}

class SuggestionLoadingState extends SuggestionState {}

class SuggestionFailureState extends SuggestionState {
  final String message;

  SuggestionFailureState(
      {this.message =
          'Something went wrong, Please check your connection and try again!.'});
}
