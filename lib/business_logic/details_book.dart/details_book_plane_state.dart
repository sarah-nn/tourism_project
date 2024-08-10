part of 'details_book_plane_cubit.dart';

sealed class DetailsBookPlaneState {}

final class DetailsBookPlaneInitial extends DetailsBookPlaneState {}

final class DetailsBookPlaneLoading extends DetailsBookPlaneState {}

final class DetailsBookPlaneSuccess extends DetailsBookPlaneState {
  List<DetailsBookPlaneModel> detailsBookPlane;
  DetailsBookPlaneSuccess(this.detailsBookPlane);
}

final class DetailsBookPlaneFailure extends DetailsBookPlaneState {
  final String errMessage;
  DetailsBookPlaneFailure({required this.errMessage});
}
