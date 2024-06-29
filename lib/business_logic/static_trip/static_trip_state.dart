part of 'static_trip_cubit.dart';

sealed class StaticTripState {}

final class StaticTripInitial extends StaticTripState {}

final class StaticTripLoading extends StaticTripState {}

final class AllStaticTripSuccess extends StaticTripState {
  final List<AllStaticTripModel> allTripList;

  AllStaticTripSuccess({required this.allTripList});
}

final class StaticTripDetails extends StaticTripState {
  final StaticDetailsModel staticModel;

  StaticTripDetails({required this.staticModel});
}

final class StaticTripFail extends StaticTripState {
  final String errMessage;

  StaticTripFail({required this.errMessage});
}
