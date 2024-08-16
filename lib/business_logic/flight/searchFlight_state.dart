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

final class SearchFlightDyanmicSuccessGo extends SearchFlightState {
  List<GoingTripDynamic>? goingTrip;
  SearchFlightDyanmicSuccessGo({@required this.goingTrip});
}

final class SearchFlightDyanmicSuccessRound extends SearchFlightState {
  final Dynamicflight fligh;

  SearchFlightDyanmicSuccessRound({required this.fligh});
}
