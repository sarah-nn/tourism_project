import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';

part 'detailsTrip_state.dart';

class DetailsPlaneTripCubit extends Cubit<DetailsPlaneTripState> {
  DetailsPlaneTripCubit() : super(DetailsPlaneTripInitial());
  GoingPlaneTrip? goingPlaneTrip;
  var data;

  Future<GoingPlaneTrip?> getDetailsPalneTrip(String id) async {
    var uri = Uri.parse(EndPoint.flightDetails + id);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsPlaneTripLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        goingPlaneTrip = GoingPlaneTrip.fromJson(data);
        print(response.body);
        emit(DetailsPlaneTripSuccess(goingPlaneTrip!));
      } else {
        var message = json.decode(response.body);
        emit(
            DetailsPlaneTripFailure(errMessage: message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      // emit(DetailsPlaneTripFailure(errMessage: e.toString()));
    }
    return goingPlaneTrip;
  }

  Future<void> bookPlane({
    required String sourceTripId,
    required String destinationTripId,
    required String tripName,
    required String numberOfPeople,
    // required String startDate,
    // required String endDate,
    required String tripNote,
    required String planeTripId,
    //   required String planeTripAwayId
  }) async {
    var uri = Uri.parse(EndPoint.bookPlane);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.post(uri, headers: header, body: {
      'source_trip_id': sourceTripId,
      'destination_trip_id': destinationTripId,
      'trip_name': tripName,
      'number_of_people': numberOfPeople,
      // 'start_date': startDate,
      //'end_date': endDate,
      'trip_note': tripNote,
      'plane_trip_id': planeTripId,
      // 'plane_trip_away_id': planeTripAwayId
    });
    try {
      // emit(RoomLoading());
      if (response.statusCode == 200) {
        emit(BookPlaneSuccess());
        print(response.body);
      } else {
        var message = json.decode(response.body);
        print(message);
        emit(BookPlaneFailure(errMessage: message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      emit(BookPlaneFailure(errMessage: e.toString()));
    }
  }
}
