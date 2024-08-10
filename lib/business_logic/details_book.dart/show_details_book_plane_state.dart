part of 'show_details_book_plane_cubit.dart';

sealed class ShowDetailsBookPlaneState {}

final class ShowDetailsBookPlaneInitial extends ShowDetailsBookPlaneState {}

final class ShowDetailsBookPlaneLoading extends ShowDetailsBookPlaneState {}

final class ShowDetailsBookPlaneSuccess extends ShowDetailsBookPlaneState {
  ShowDetailsBookPlaneModel showDetailsBookPlaneModel;
  ShowDetailsBookPlaneSuccess(this.showDetailsBookPlaneModel);
}

final class DeleteBookPlaneSuccess extends ShowDetailsBookPlaneState {
  final String message;
  final int deletedHotelId;
  DeleteBookPlaneSuccess(this.message, this.deletedHotelId);
}

final class ShowDetailsBookPlaneFailure extends ShowDetailsBookPlaneState {
  final String errMessage;
  ShowDetailsBookPlaneFailure({required this.errMessage});
}

final class DeleteBookPlaneFailure extends ShowDetailsBookPlaneState {
  final String errMessage;
  DeleteBookPlaneFailure({required this.errMessage});
}

final class EditBookPlaneSuccess extends ShowDetailsBookPlaneState {
  ShowDetailsBookPlaneModel showDetailsBookPlaneModel;
  EditBookPlaneSuccess(this.showDetailsBookPlaneModel);
}

final class EditBookPlaneFailure extends ShowDetailsBookPlaneState {
  final String errMessage;

  EditBookPlaneFailure(this.errMessage);
}
