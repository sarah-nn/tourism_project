part of 'dont_miss_cubit.dart';

sealed class DontMiisState {}

final class DontMiisInitial extends DontMiisState {}

final class DontMiisLoading extends DontMiisState {}

final class DontMiisSuccess extends DontMiisState {
  List<DontMissModel> dontMissModel;
  DontMiisSuccess(this.dontMissModel);
}

final class DontMiisFailure extends DontMiisState {
  final String errMessage;
  DontMiisFailure({required this.errMessage});
}

final class TopVisitedSuccess extends DontMiisState {
  List<TopVisitedModel> topVisitedModel;
  TopVisitedSuccess(this.topVisitedModel);
}

final class TopVisitedFailure extends DontMiisState {
  final String errMessage;
  TopVisitedFailure({required this.errMessage});
}
