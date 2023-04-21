part of 'suggestion_bloc.dart';

@immutable
abstract class SuggestionEvent {}

class AddSuggestionEvent extends SuggestionEvent {
  final String suggestion;

  AddSuggestionEvent({
    required this.suggestion,
  });
}

class DeleteSuggestionEvent extends SuggestionEvent {
  final int suggestionId;

  DeleteSuggestionEvent({required this.suggestionId});
}

class GetAllSuggestionEvent extends SuggestionEvent {
  final String? query;

  GetAllSuggestionEvent({this.query});
}
