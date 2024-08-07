import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/search_hotel_model.dart';
import '../../core/utils/end_point.dart';
part 'searchHotel_state.dart';

class SearchHotelCubit extends Cubit<SearchHotelState> {
  SearchHotelCubit() : super(SearchHotelInitial());
  var data = [];
  List<HotelModel> HotelList = [];
  Future<List<HotelModel>> getAllHotel(String CountryId) async {
    var uri = Uri.parse(EndPoint.searchHotel + CountryId);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(SearchHotelLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        HotelList =
            data.map((e) => HotelModel.fromJson(e)).toList(growable: true);
        print(response.body);
        emit(SearchHotelSuccess(HotelList));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      try {
        emit(SearchHotelFailure(errMessage: e.toString()));
      } catch (e) {
        print(e);
      }
    }
    print(HotelList);
    return HotelList;
  }
}
