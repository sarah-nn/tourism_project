part of 'searchHotel_cubit.dart';

sealed class SearchHotelState {}

final class SearchHotelInitial extends SearchHotelState {}

final class SearchHotelLoading extends SearchHotelState {}

final class SearchHotelSuccess extends SearchHotelState {
  List<HotelModel> HotelList;
  SearchHotelSuccess(this.HotelList);
}

final class SearchHotelFailure extends SearchHotelState {
  final String errMessage;
  SearchHotelFailure({required this.errMessage});
}
