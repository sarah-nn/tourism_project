part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favoriteModel;
  FavoriteSuccess(this.favoriteModel);
}

final class FavoriteFailure extends FavoriteState {
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}

final class AddFavoriteSuccess extends FavoriteState {
  final String errMessage;
  AddFavoriteSuccess({required this.errMessage});
}

final class AddFavoriteFailure extends FavoriteState {
  final String errMessage;
  AddFavoriteFailure({required this.errMessage});
}

final class RemoveFavoriteSuccess extends FavoriteState {
  final String errMessage;
  final int favoriteId;
  RemoveFavoriteSuccess({required this.favoriteId, required this.errMessage});
}

final class RemoveFavoriteFailure extends FavoriteState {
  final String errMessage;
  RemoveFavoriteFailure({required this.errMessage});
}
