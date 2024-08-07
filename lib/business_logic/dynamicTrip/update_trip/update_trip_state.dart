part of 'update_trip_cubit.dart';

@immutable
sealed class UpdateTripState {}

final class UpdateTripInitial extends UpdateTripState {}

final class UpdateTripSuccess extends UpdateTripState {
  final String message;

  UpdateTripSuccess({required this.message});
}

final class UpdateTripFail extends UpdateTripState {
  final String message;

  UpdateTripFail({required this.message});
}
