part of 'dynamic_flight_cubit.dart';

@immutable
sealed class DynamicFlightState {}

final class DynamicFlightInitial extends DynamicFlightState {}

final class DynamicFlightLoading extends DynamicFlightState {}

final class DynamicFlightFail extends DynamicFlightState {
  final String errMessage;

  DynamicFlightFail({required this.errMessage});
}

final class DynamicFlightOneWay extends DynamicFlightState {}

final class DynamicFlightRound extends DynamicFlightState {}
