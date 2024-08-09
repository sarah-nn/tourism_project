part of 'places_cubit.dart';

sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesLoading extends PlacesState {}

final class PlacesSuccess extends PlacesState {
  List<Place>? placelist;
  List<PlaceDependOnCategoryModel>? placesCategory;
  PlacesSuccess({@required this.placelist, @required this.placesCategory});
}

final class PlacesCategory extends PlacesState {
  final List<Map<String, dynamic>> dataList;

  PlacesCategory({required this.dataList});
}

final class PlacesFailure extends PlacesState {
  final String errMessage;

  PlacesFailure({required this.errMessage});
}

final class CountryPlacesSuccess extends PlacesState {
  List<Map<String, dynamic>> places_country = [];
  CountryPlacesSuccess(this.places_country);
}

final class NoCountryPlacesSuccess extends PlacesState {
  NoCountryPlacesSuccess();
}
