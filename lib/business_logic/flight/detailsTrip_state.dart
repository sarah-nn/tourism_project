part of 'detailsTrip_cubit.dart';

sealed class DetailsPlaneTripState {}

final class DetailsPlaneTripInitial extends DetailsPlaneTripState {}

final class DetailsPlaneTripLoading extends DetailsPlaneTripState {}

final class DetailsPlaneTripSuccess extends DetailsPlaneTripState {
  final GoingPlaneTrip goingPlaneTrip;
  DetailsPlaneTripSuccess(this.goingPlaneTrip);
}

final class DetailsPlaneTripFailure extends DetailsPlaneTripState {
  final String errMessage;
  DetailsPlaneTripFailure({required this.errMessage});
}
