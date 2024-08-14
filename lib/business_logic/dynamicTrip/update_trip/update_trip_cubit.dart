import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';

part 'update_trip_state.dart';

class UpdateTripCubit extends Cubit<UpdateTripState> {
  UpdateTripCubit() : super(UpdateTripInitial());

  //======== Edit Variable ================
  String newDate = '';
  String addPeople = '';
  String newHotelId = '';
  String addc1 = '';
  String addc2 = '';
  String addc4 = '';
  String addc6 = '';
  String newReturn = '';
  String newGoing = '';
  String addednotes = '';
  TextEditingController newNotes = TextEditingController();

  Map<String, String> updateRequestBody(String endDate) {
    Map<String, String> body = {
      'end_date': newDate == '' ? endDate : newDate,
      'count_room_C1': addc1 == '' ? "0" : addc1,
      'count_room_C2': addc2 == '' ? "0" : addc2,
      'count_room_C4': addc4 == '' ? "0" : addc4,
      'count_room_C6': addc6 == '' ? "0" : addc6,
    };
    if (addednotes != '') {
      body['trip_note'] = addednotes;
    }
    if (addPeople != '') {
      body['number_of_people'] = addPeople;
    }
    if (newHotelId != '') {
      body['hotel_id'] = newHotelId;
    }
    for (int i = 0; i < placeIds.length; i++) {
      body['place_ids[$i]'] = placeIds[i].toString();
    }

    for (int i = 0; i < activities.length; i++) {
      body['activities[$i]'] = activities[i].toString();
    }
    if (newGoing != '') {
      body['plane_trip_id'] = newGoing;
    }

    if (newReturn != '') {
      body['plane_trip_away_id'] = newReturn;
    }
    return body;
  }

  void printList() {
    Map<String, String> tripRequestBody = updateRequestBody("nothing");

    print("\n\n\n✅==$tripRequestBody==");
  }

  Future<void> updateDynamicTrip(String tripId, String endDate) async {
    Map<String, String> tripRequestBody = updateRequestBody(endDate);
    http.Response response = await http.post(
        Uri.parse(EndPoint.updateDynamicTrip + tripId),
        body: tripRequestBody,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $myToken'
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['added price'];
      print('❗❗❗❗${jsonDecode(response.body)}');
      print(data);
      emit(UpdateTripSuccess(message: data.toString()));
      return data;
    } else {
      print(
          "api error in update dynamic ${response.statusCode} , with body ${response.body}");
      var message = jsonDecode(response.body)['message'];
      print(message);
      emit(UpdateTripFail(message: message));
    }
    return null;
  }
}
