part of 'show_details_book_hotel_cubit.dart';

sealed class ShowDetailsBookHotelState {}

final class ShowDetailsBookHotelInitial extends ShowDetailsBookHotelState {}

final class ShowDetailsBookHotelLoading extends ShowDetailsBookHotelState {}

final class ShowDetailsBookHotelSuccess extends ShowDetailsBookHotelState {
  ShowDetailsBookHotelModel showDetailsBookHotelModel;
  ShowDetailsBookHotelSuccess(this.showDetailsBookHotelModel);
}

final class DeleteBookHotelSuccess extends ShowDetailsBookHotelState {
  final String message;
  final int deletedHotelId;
  DeleteBookHotelSuccess(this.message, this.deletedHotelId);
}

final class ShowDetailsBookHotelFailure extends ShowDetailsBookHotelState {
  final String errMessage;
  ShowDetailsBookHotelFailure({required this.errMessage});
}

final class DeleteBookHotelFailure extends ShowDetailsBookHotelState {
  final String errMessage;

  DeleteBookHotelFailure(this.errMessage);
}

final class EditBookHotelSuccess extends ShowDetailsBookHotelState {
  ShowDetailsBookHotelModel showDetailsBookHotelModel;
  EditBookHotelSuccess(this.showDetailsBookHotelModel);
}

final class EditBookHotelFailure extends ShowDetailsBookHotelState {
  final String errMessage;

  EditBookHotelFailure(this.errMessage);
}
