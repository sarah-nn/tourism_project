part of 'activity_cubit.dart';

sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class ActivityLoading extends ActivityState {}

final class ActivitySuccess extends ActivityState {
  final List<dynamic> activities;
  ActivitySuccess({required this.activities});
}

final class ActivityFail extends ActivityState {
  final String errMessage;

  ActivityFail({required this.errMessage});
}
