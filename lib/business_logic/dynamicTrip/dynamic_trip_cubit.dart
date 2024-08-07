import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';
import 'package:tourism_project/data/models/dynamic_booklist_model.dart';

part 'dynamic_trip_state.dart';

class DynamicTripCubit extends Cubit<DynamicTripState> {
  DynamicTripCubit() : super(DynamicTripInitial());

  TextEditingController tripName = TextEditingController();
  List<String> triplist = [];
  List<DynamicListBookingModel> bookingList = [];
  String tripNameVal = '';
  String startDate = '';
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

  DataModel? data2;

  void addPlaceIds(int value) {
    placeIds.add(value);
    print("adeddd");
    print(placeIds);
  }

  void addActivites(int value) {
    activities.add(value);
  }

  // void printList() {
  //   Map<String, String> tripRequestBody = updateRequestBody();

  //   print("\n\n\n✅==$tripRequestBody==");
  // }

  Map<String, String> buildRequestBody() {
    Map<String, String> body = {
      'source_trip_id': sourceTripId,
      'destination_trip_id': destinationTripId,
      'trip_name': tripName.text,
      'number_of_people': numOfPeople.toString(),
      'start_date': startDate,
      'end_date': endDate,
      'count_room_C2': controller2.text.isEmpty ? "0" : controller2.text,
      'count_room_C4': controller4.text.isEmpty ? "0" : controller4.text,
      'count_room_C6': controller6.text.isEmpty ? "0" : controller6.text,
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
      body['plane_trip_id'] = goingPlaneId;
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

  Future<DataModel?> dynamicTripBookingdetails(String id) async {
    http.Response response = await http
        .get(Uri.parse(EndPoint.dynamicBookingDetails + id), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    });
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        print("===data of dynmic trip deatals $data");
        data2 = DataModel.fromJson(data);
        var goingPlane = data['going_trip'];
        var returnPlane = data['return_trip'];
        var hotelTrip = data['hotel'];
        print("🔴🔴$hotelTrip");
        emit(returnPlane == [] && goingPlane == []
            ? hotelTrip == []
                ? DynamicTripBookingSuccess(dynamicbookingModel: data2!)
                : DynamicTripBookingSuccess(
                    dynamicbookingModel: data2!, hotelTrip: hotelTrip)
            : returnPlane == []
                ? hotelTrip == []
                    ? DynamicTripBookingSuccess(
                        dynamicbookingModel: data2!, going_plane: goingPlane)
                    : DynamicTripBookingSuccess(
                        dynamicbookingModel: data2!,
                        going_plane: goingPlane,
                        hotelTrip: hotelTrip)
                : goingPlane == []
                    ? hotelTrip == []
                        ? DynamicTripBookingSuccess(
                            dynamicbookingModel: data2!,
                            return_plane: returnPlane)
                        : DynamicTripBookingSuccess(
                            dynamicbookingModel: data2!,
                            return_plane: returnPlane,
                            hotelTrip: hotelTrip)
                    : hotelTrip == []
                        ? DynamicTripBookingSuccess(
                            dynamicbookingModel: data2!,
                            going_plane: goingPlane,
                            return_plane: returnPlane)
                        : DynamicTripBookingSuccess(
                            dynamicbookingModel: data2!,
                            going_plane: goingPlane,
                            return_plane: returnPlane,
                            hotelTrip: hotelTrip));
      } else {
        print(
            "response.statusCode ${response.statusCode} , with body ${response.body}");
        var message = jsonDecode(response.body)['message'];
        print(message);
        emit(BookingDynamicFail(errMessage: message));
      }
    } catch (e) {
      print(response.body);
      print(e.toString());
    }
    return data2;
  }

  Future<List<DynamicListBookingModel>> getAllDynamicBook(String pre_Up) async {
    var uri = Uri.parse(EndPoint.getAllDynamicList);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DynamicTripLoading());
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body)['data']['$pre_Up'] as List;

        bookingList =
            data.map((json) => DynamicListBookingModel.fromJson(json)).toList();
        print(bookingList);
        emit(DynamicBookingList(bookList: bookingList));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("exception in ");
      emit(BookingDynamicFail(errMessage: e.toString()));
    }
    print(bookingList);
    return bookingList;
  }

  Future<void> deleteDynamicTrip(String tripId) async {
    var uri = Uri.parse(EndPoint.deleteDynamicTrip + tripId);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.delete(uri, headers: header);
    if (response.statusCode == 200) {
      getAllDynamicBook('future_trip');
    } else {
      // String mssg = jsonDecode(response.body)['message'];
      print(response.body);
    }
  }
}
