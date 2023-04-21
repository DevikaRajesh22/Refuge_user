part of 'manage_members_bloc.dart';

@immutable
abstract class ManageMembersEvent {}

class GetAllMembersEvent extends ManageMembersEvent {
  final String? query;

  GetAllMembersEvent({this.query});
}

class AddMemberEvent extends ManageMembersEvent {
  final String name, gender, dob;
  final int disasterId;

  AddMemberEvent({
    required this.name,
    required this.dob,
    required this.gender,
    required this.disasterId,
  });
}

class EditMemberEvent extends ManageMembersEvent {
  final String name, dob, gender;
  final int memberId, disasterId;

  EditMemberEvent({
    required this.memberId,
    required this.name,
    required this.dob,
    required this.gender,
    required this.disasterId,
  });
}

class DeleteMemberEvent extends ManageMembersEvent {
  final int memberId;

  DeleteMemberEvent({
    required this.memberId,
  });
}
