import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/country_model.dart';
import 'package:http/http.dart' as http;

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  List data = [];
  List<CountryModel> countryList = [];

  Future<List<CountryModel>> getAllCountrey() async {
    var uri = Uri.parse(EndPoint.allCountries);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(CountryLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        countryList =
            data.map((e) => CountryModel.fromJson(e)).toList(growable: true);
        emit(CountrySuccess(countryList));
      } else {
        print("api error${response.statusCode}");
        print("api error${response.body}");
      }
    } catch (e) {
      print("$e");
      // emit(CountryFailure(errMessage: e.toString()));
    }
    print(countryList);
    return countryList;
  }
}
