part of 'details_book_static_trip_cubit.dart';

class DetailsBookStaticTripState {}

final class DetailsBookStaticTripInitial extends DetailsBookStaticTripState {}

final class DetailsBookStaticTripLoading extends DetailsBookStaticTripState {}

final class DetailsBookStaticTripSuccess extends DetailsBookStaticTripState {
  final UpcomingAndPreviousStatikModel? upcomingAndPreviousStatikModel;
  DetailsBookStaticTripSuccess({required this.upcomingAndPreviousStatikModel});
}

final class DetailsBookStaticTripFailure extends DetailsBookStaticTripState {
  final String errMessage;
  DetailsBookStaticTripFailure({required this.errMessage});
}

// final class DeleteBookStaticSuccess extends DetailsBookStaticTripState {
//   final String message;
//   final int deletedStaticId;
//   DeleteBookStaticSuccess(this.message, this.deletedStaticId);
// }

// final class DeleteBookStaticFailure extends DetailsBookStaticTripState {
//   final String errMessage;
//   DeleteBookStaticFailure({required this.errMessage});
// }
