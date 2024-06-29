part of 'country_cubit.dart';

sealed class CountryState {}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {}

final class CountrySuccess extends CountryState {
  final List<CountryModel> countryList;
  CountrySuccess(this.countryList);
}

final class CountryFailure extends CountryState {
  final String errMessage;

  CountryFailure({required this.errMessage});
}
