import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

part 'dynamic_trip_state.dart';

class DynamicTripCubit extends Cubit<DynamicTripState> {
  DynamicTripCubit() : super(DynamicTripInitial());

  TextEditingController tripName = TextEditingController();
  List<String> triplist = [];
  // List<int> placeIds = [];
  // List<int> activities = [1, 2];
  String tripNameVal = '';
  String startDate = '';
  //String plane_trip_id = goingPlaneId;
  //String plane_trip_away_id = returnPlaneId;
  String endDate = '';
  String sourceTripId = '';
  String destinationTripId = '';
  String hotelId = '';
  int numOfPeople = 0;
  int tripDynamicId = 0;

  // for Room Capacity
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  //for number of people
  TextEditingController num = TextEditingController();

  //for trip note
  TextEditingController tripNote = TextEditingController();

  //DynamicTripModel? bookingModel;
  Data? data2;

  void addPlaceIds(int value) {
    placeIds.add(value);
    print("adeddd");
    print(placeIds);
  }

  void addActivites(int value) {
    activities.add(value);
  }

  void printList() {
    Map<String, String> tripRequestBody = buildRequestBody();

    // print("\n\n\n==$tripRequestBody==");
  }

  Map<String, String> buildRequestBody() {
    Map<String, String> body = {
      'source_trip_id': sourceTripId,
      'destination_trip_id': destinationTripId,
      'trip_name': tripName.text,
      'number_of_people': numOfPeople.toString(),
      'start_date': startDate,
      'end_date': endDate,
      // 'plane_trip_id': '1',
      // 'plane_trip_away_id': '2',
      'count_room_C2': controller2.text.isEmpty ? "0" : controller2.text,
      'count_room_C4': controller4.text.isEmpty ? "0" : controller4.text,
      'count_room_C6': controller6.text.isEmpty ? "0" : controller6.text,
      //'place_ids[0]': '1',
      //'activities[0]': '1',
    };

    if (tripNote.text != '') {
      body['trip_note'] = tripNote.text;
    }
    if (hotelId != '') {
      body['hotel_id'] = hotelId;
    }

    if (onePlaneId != '') {
      body['plane_trip_id'] = onePlaneId;
    }

    if (goingPlaneId != '') {
      body['plane_trip_away_id'] = goingPlaneId;
    }

    if (returnPlaneId != '') {
      body['plane_trip_away_id'] = returnPlaneId;
    }

    for (int i = 0; i < placeIds.length; i++) {
      body['place_ids[$i]'] = placeIds[i].toString();
    }

    for (int i = 0; i < activities.length; i++) {
      body['activities[$i]'] = activities[i].toString();
    }

    return body;
  }

  Future<void> dynamicTripBooking() async {
    Map<String, String> tripRequestBody = buildRequestBody();
    // emit(UserLoading());
    http.Response response = await http.post(Uri.parse(EndPoint.dynamicBooking),
        body: tripRequestBody,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $myToken'
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print("\n\n\n\n$data");
      print("=========${data['dynamic_trip']['trip_name']}");
      tripDynamicId = data['dynamic_trip']['id'];
      print(tripDynamicId);

      // bookingModel = DynamicTripModel.fromJson(data);
      emit(BookingSuccess(tripId: tripDynamicId.toString()));
      return data;
    } else {
      print(
          "response.statusCode ${response.statusCode} , with body ${response.body}");
      var message = jsonDecode(response.body)['message'];
      print(message);
      emit(BookingDynamicFail(errMessage: message));
    }
    return null;
  }

  Future<Data?> dynamicTripBookingdetails(String id) async {
    http.Response response = await http
        .get(Uri.parse(EndPoint.dynamicBookingDetails + id), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      data2 = Data.fromJson(data['dynamic_trip']);
      emit(DynamicTripBookingSuccess(dynamicbookingModel: data2!));
      return data2;
    } else {
      print(
          "response.statusCode ${response.statusCode} , with body ${response.body}");
      var message = jsonDecode(response.body)['message'];
      print(message);
      emit(BookingDynamicFail(errMessage: message));
    }
    return data2;
  }
}
