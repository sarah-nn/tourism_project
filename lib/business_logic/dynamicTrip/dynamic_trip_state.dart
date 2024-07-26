part of 'dynamic_trip_cubit.dart';

@immutable
sealed class DynamicTripState {}

final class DynamicTripInitial extends DynamicTripState {}

final class BookingSuccess extends DynamicTripState {
  final String tripId;

  BookingSuccess({required this.tripId});
}

final class DynamicTripBookingSuccess extends DynamicTripState {
  final Data dynamicbookingModel;

  DynamicTripBookingSuccess({required this.dynamicbookingModel});
}

final class BookingDynamicFail extends DynamicTripState {
  final String errMessage;

  BookingDynamicFail({required this.errMessage});
}
