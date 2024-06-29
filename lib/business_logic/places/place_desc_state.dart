part of 'place_desc_cubit.dart';

sealed class PlaceDescState {}

final class PlaceDescInitial extends PlaceDescState {}

final class PlaceDescLoading extends PlaceDescState {}

final class PlaceDescSuccess extends PlaceDescState {
  final PlaceDescModel placeDescModel;

  PlaceDescSuccess(this.placeDescModel);
}

final class PLaceCommentsList extends PlaceDescState {
  List<Comment> commentsList;

  PLaceCommentsList({required this.commentsList});
}

final class CommentAddSuccess extends PlaceDescState {}

final class PlaceDescFailure extends PlaceDescState {
  final String errMessage;

  PlaceDescFailure({required this.errMessage});
}
