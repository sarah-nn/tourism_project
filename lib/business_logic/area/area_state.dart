part of 'area_cubit.dart';

sealed class AreaState {}

final class AreaInitial extends AreaState {}

final class AreaLoading extends AreaState {}

final class AreaSuccess extends AreaState {
  final List<String> areaList;
  AreaSuccess({required this.areaList});
}

final class AreaFailure extends AreaState {
  final String errMessage;

  AreaFailure({required this.errMessage});
}
