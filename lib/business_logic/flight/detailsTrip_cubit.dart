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
      emit(DetailsPlaneTripFailure(errMessage: e.toString()));
    }
    return goingPlaneTrip;
  }
}
