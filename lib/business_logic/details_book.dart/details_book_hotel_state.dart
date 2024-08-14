part of 'details_book_hotel_cubit.dart';

sealed class DetailsBookHotelState {}

final class DetailsBookHotelInitial extends DetailsBookHotelState {}

final class DetailsBookHotelLoading extends DetailsBookHotelState {}

final class DetailsBookHotelSuccess extends DetailsBookHotelState {
  DetailsBookHotelModel detailsBookHotel;
  DetailsBookHotelSuccess(this.detailsBookHotel);
}

final class DetailsBookHotelFailure extends DetailsBookHotelState {
  final String errMessage;
  DetailsBookHotelFailure({required this.errMessage});
}
