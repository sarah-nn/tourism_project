part of 'searchFlight_cubit.dart';

sealed class SearchFlightState {}

final class SearchFlightInitial extends SearchFlightState {}

final class SearchFlightLoading extends SearchFlightState {}

final class SearchFlightSuccess extends SearchFlightState {
  final GoingAndReturnPlaneTrip? goingAndReturnPlaneTrip;
  final List<GoingPlaneTrip>? goingPlaneTrip;
  SearchFlightSuccess(
      {@required this.goingAndReturnPlaneTrip, @required this.goingPlaneTrip});
}

final class SearchFlightFailure extends SearchFlightState {
  final String errMessage;
  SearchFlightFailure({required this.errMessage});
}
