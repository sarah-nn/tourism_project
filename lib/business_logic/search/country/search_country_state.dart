part of 'search_country_cubit.dart';

abstract class SearchCountryState {}

class SearchInitial extends SearchCountryState {}

class SearchLoading extends SearchCountryState {}

class SearchLoaded extends SearchCountryState {
  final List<dynamic> searchResults;
  SearchLoaded(this.searchResults);
}

class SearchEmpty extends SearchCountryState {}

class SearchError extends SearchCountryState {
  final String message;
  SearchError(this.message);
}
