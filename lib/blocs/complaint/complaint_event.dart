part of 'complaint_bloc.dart';

@immutable
abstract class ComplaintEvent {}

class AddComplaintEvent extends ComplaintEvent {
  final String complaint;
  final int? serviceRequestId;

  AddComplaintEvent({
    required this.complaint,
    this.serviceRequestId,
  });
}

class DeleteComplaintEvent extends ComplaintEvent {
  final int complaintId;

  DeleteComplaintEvent({required this.complaintId});
}

class GetAllComplaintEvent extends ComplaintEvent {
  final String? query;

  GetAllComplaintEvent({this.query});
}
