part of 'dynamic_trip_cubit.dart';

@immutable
sealed class DynamicTripState {}

final class DynamicTripInitial extends DynamicTripState {}

final class DynamicTripValues extends DynamicTripState {
  final DynamicBookingValueModel tripValues;

  DynamicTripValues({required this.tripValues});
}
