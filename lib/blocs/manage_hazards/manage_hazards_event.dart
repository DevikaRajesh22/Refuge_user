part of 'manage_hazards_bloc.dart';

@immutable
abstract class ManageHazardsEvent {}

class AddHazardEvent extends ManageHazardsEvent {
  final String hazard, level;
  final int memberId;

  AddHazardEvent({
    required this.hazard,
    required this.level,
    required this.memberId,
  });
}

class DeleteHazardEvent extends ManageHazardsEvent {
  final int hazardId;

  DeleteHazardEvent({required this.hazardId});
}

class GetAllHazardsEvent extends ManageHazardsEvent {
  final String? query;

  GetAllHazardsEvent({this.query});
}
