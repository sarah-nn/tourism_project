part of 'book_static_trip_cubit.dart';

sealed class BookStaticTripState {}

final class BookStaticTripInitial extends BookStaticTripState {}

final class BookLoading extends BookStaticTripState {}

final class CheckNumSuccess extends BookStaticTripState {
  final CheckNum checkNum;

  CheckNumSuccess({required this.checkNum});
}

final class BookSuccess extends BookStaticTripState {
  final String successMessage;

  BookSuccess({required this.successMessage});
}

final class BookFail extends BookStaticTripState {
  final String errMessage;

  BookFail({required this.errMessage});
}
