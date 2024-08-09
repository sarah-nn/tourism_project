part of 'dynamic_trip_cubit.dart';

@immutable
sealed class DynamicTripState {}

final class DynamicTripInitial extends DynamicTripState {}

final class DynamicTripLoading extends DynamicTripState {}

final class BookingSuccess extends DynamicTripState {
  final String tripId;

  BookingSuccess({required this.tripId});
}

final class DynamicTripBookingSuccess extends DynamicTripState {
  final DataModel dynamicbookingModel;
  final dynamic going_plane;
  final dynamic return_plane;
  final dynamic hotelTrip;
  DynamicTripBookingSuccess(
      {required this.dynamicbookingModel,
      @required this.going_plane,
      @required this.return_plane,
      @required this.hotelTrip});
}

final class DynamicBookingList extends DynamicTripState {
  final List<DynamicListBookingModel> bookList;

  DynamicBookingList({required this.bookList});
}

final class BookingDynamicFail extends DynamicTripState {
  final String errMessage;

  BookingDynamicFail({required this.errMessage});
}

final class DeleteBookinDone extends DynamicTripState {
  final String message;

  DeleteBookinDone({required this.message});
}
