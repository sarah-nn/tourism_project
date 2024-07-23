import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';

part 'searchFlight_state.dart';

class SearchFlightCubit extends Cubit<SearchFlightState> {
  SearchFlightCubit() : super(SearchFlightInitial());
  GoingAndReturnPlaneTrip? goingAndReturnPlaneTrip;
  List<GoingPlaneTrip> goingPlaneTrip = [];
  var data = [];

  Future<GoingAndReturnPlaneTrip?> getallPlaneTripGoingAndReturn({
    required String country_source_id,
    required String country_destination_id,
    required String flight_date,
    // required String? type,
  }) async {
    var uri = Uri.parse(EndPoint.searchFlight);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.post(uri, headers: header, body: {
      'country_source_id': country_source_id,
      'country_destination_id': country_destination_id,
      'flight_date': flight_date,
      'type': '2'
    });
    try {
      emit(SearchFlightLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        goingAndReturnPlaneTrip = GoingAndReturnPlaneTrip.fromJson(data);
        print(response.body);
        emit(SearchFlightSuccess(
            goingAndReturnPlaneTrip: goingAndReturnPlaneTrip));
      } else {
        var message = json.decode(response.body);
        emit(SearchFlightFailure(errMessage: message['message'].toString()));
        print("api error ${response.statusCode} , with body ${response.body}");
      }
    } catch (e) {
      print("$e");
      emit(SearchFlightFailure(errMessage: e.toString()));
    }
    //! comment print here becuase it make null check operator
    // print(
    //     "this is the cubit result of flight going and return ${goingAndReturnPlaneTrip!.data.goingTrip.map((e) => e.airportDestination)}");
    return goingAndReturnPlaneTrip;
  }

  Future<List<GoingPlaneTrip>> getallPlaneTripGoing({
    required String country_source_id,
    required String country_destination_id,
    required String flight_date,
    // required String? type,
  }) async {
    var uri = Uri.parse(EndPoint.searchFlight);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.post(uri, headers: header, body: {
      'country_source_id': country_source_id,
      'country_destination_id': country_destination_id,
      'flight_date': flight_date,
      'type': '1'
    });
    try {
      emit(SearchFlightLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        goingPlaneTrip =
            data.map((e) => GoingPlaneTrip.fromJson(e)).toList(growable: true);
        print(response.body);
        emit(SearchFlightSuccess(goingPlaneTrip: goingPlaneTrip));
      } else {
        var message = json.decode(response.body);
        emit(SearchFlightFailure(errMessage: message['message'].toString()));
        print("api error ${response.statusCode} , with body ${response.body}");
      }
    } catch (e) {
      print("$e");
      emit(SearchFlightFailure(errMessage: e.toString()));
    }
    return goingPlaneTrip;
  }
}
