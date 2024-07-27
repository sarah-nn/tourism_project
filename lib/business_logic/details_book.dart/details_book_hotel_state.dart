part of 'details_book_hotel_cubit.dart';

sealed class DetailsBookHotelState {}

final class DetailsBookHotelInitial extends DetailsBookHotelState {}

final class DetailsBookHotelLoading extends DetailsBookHotelState {}

final class DetailsBookHotelSuccess extends DetailsBookHotelState {
  List<DetailsBookHotelModel> detailsBookHotel;
  DetailsBookHotelSuccess(this.detailsBookHotel);
}

final class DetailsBookHotelFailure extends DetailsBookHotelState {
  final String errMessage;
  DetailsBookHotelFailure({required this.errMessage});
}

//=======================================================================
// final class ShowDetailsBookHotelSuccess extends DetailsBookHotelState {
//   ShowDetailsBookHotelModel showDetailsBookHotelModel;
//   ShowDetailsBookHotelSuccess(this.showDetailsBookHotelModel);
// }

// final class ShowDetailsBookHotelFailure extends DetailsBookHotelState {
//   final String errMessage;
//   ShowDetailsBookHotelFailure({required this.errMessage});
// }

// final class ShowDetailsBookHotelLoading extends DetailsBookHotelState {}

//======================================================================
// final class DeleteHotelLoading extends DetailsBookHotelState {}

// final class DeleteHotelSuccess extends DetailsBookHotelState {
//   final String message;
//   DeleteHotelSuccess({required this.message});
// }

// final class DeleteHotelFailure extends DetailsBookHotelState {
//   final String errMessage;
//   DeleteHotelFailure({required this.errMessage});
//}
