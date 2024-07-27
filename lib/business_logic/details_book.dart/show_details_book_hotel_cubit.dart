import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';
import 'package:http/http.dart' as http;

part 'show_details_book_hotel_state.dart';

class ShowDetailsBookHotelCubit extends Cubit<ShowDetailsBookHotelState> {
  ShowDetailsBookHotelCubit() : super(ShowDetailsBookHotelInitial());
  var data1 = [];
  ShowDetailsBookHotelModel? showDetailsBookHotel;
  ShowDetailsBookHotelModel? editshowDetailsBookHotel;

  String? message;

  Future<ShowDetailsBookHotelModel?> getAllShowDetailsBookHotel(
      String id) async {
    var uri = Uri.parse(EndPoint.showDetailsBookHotel + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(ShowDetailsBookHotelLoading());
      if (response.statusCode == 200) {
        print('=============${response.body}');

        var data2 = json.decode(response.body);
        showDetailsBookHotel = ShowDetailsBookHotelModel.fromJson(data2);
        print('=============${response.body}');
        emit(ShowDetailsBookHotelSuccess(showDetailsBookHotel!));
      } else {
        print(response.statusCode);
        print("api error${response.statusCode}");
      }
    } catch (e) {
      emit(ShowDetailsBookHotelFailure(errMessage: e.toString()));
    }

    print(showDetailsBookHotel);
    return showDetailsBookHotel;
  }

  Future<void> deleteHotel(String id) async {
    var uri = Uri.parse(EndPoint.deleteBookinHotel + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.delete(uri, headers: header);
    try {
      // emit(());
      if (response.statusCode == 200) {
        print('=============${response.body}');

        message = json.decode(response.body);
        print('=============${response.body}');
        emit(DeleteBookHotelSuccess(message!, int.parse(id)));
      } else {
        print(response.statusCode);
        print("api error${response.statusCode}");
      }
    } catch (e) {
      emit(DeleteBookHotelFailure(e.toString()));
    }
  }

  Future<ShowDetailsBookHotelModel?> editBookHotel(
      String id,
      String nameTrip,
      String endDate,
      String capacity_2,
      String capacity_4,
      String capacity_6) async {
    var uri = Uri.parse(EndPoint.editBookHotel + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.post(uri, headers: header, body: {
      'trip_name': nameTrip,
      'end_date': endDate,
      'count_room_C2': capacity_2,
      'count_room_C4': capacity_4,
      'count_room_C6': capacity_6
    });
    try {
      // emit(ShowDetailsBookHotelLoading());
      if (response.statusCode == 200) {
        print('=============${response.body}');

        var data2 = json.decode(response.body)['data'];
        editshowDetailsBookHotel = ShowDetailsBookHotelModel.fromJson(data2);
        print('=============${response.body}');
        emit(EditBookHotelSuccess(editshowDetailsBookHotel!));
      } else {
        print(response.statusCode);
        print("api error${response.statusCode}");
        var message = json.decode(response.body);
        emit(EditBookHotelFailure(message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      emit(EditBookHotelFailure(e.toString()));
    }

    print(editshowDetailsBookHotel);
    return editshowDetailsBookHotel;
  }
}
