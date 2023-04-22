part of 'complaints_bloc.dart';

@immutable
abstract class ComplaintsEvent {}

class AddComplaintsEvent extends ComplaintsEvent {
  final String complaint;

  AddComplaintsEvent({
    required this.complaint,
  });
}

class DeleteComplaintsEvent extends ComplaintsEvent {
  final int complaintId;

  DeleteComplaintsEvent({required this.complaintId});
}

class GetAllComplaintsEvent extends ComplaintsEvent {
  final String? query;

  GetAllComplaintsEvent({this.query});
}
