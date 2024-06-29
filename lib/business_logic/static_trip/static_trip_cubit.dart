import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/all_static_trip_model.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';

part 'static_trip_state.dart';

class StaticTripCubit extends Cubit<StaticTripState> {
  StaticTripCubit() : super(StaticTripInitial());

  var data = [];
  List<AllStaticTripModel> tripList = [];

  Future<List<AllStaticTripModel>> getAllStaticTrip() async {
    var uri = Uri.parse(EndPoint.allStaticTrip);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(StaticTripLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        tripList = data
            .map((e) => AllStaticTripModel.fromJson(e))
            .toList(growable: true);
        emit(AllStaticTripSuccess(allTripList: tripList));
      } else {
        print("api error${response.statusCode}");
        print("=================${response.body}");
      }
    } catch (e) {
      print("exception in ");
      emit(StaticTripFail(errMessage: e.toString()));
    }
    print(response.body);
    print(tripList);
    return tripList;
  }

  Future<void> getStaticTripDetails(String tripId) async {
    var uri = Uri.parse(EndPoint.staticTripDetails + tripId);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(StaticTripLoading());
      if (response.statusCode == 200) {
        print(response.body);
        var data = json.decode(response.body)['data'];
        var staticModel = StaticDetailsModel.fromJson(data);
        emit(StaticTripDetails(staticModel: staticModel));
      } else {
        print("api error${response.statusCode} + ${response.body}");
      }
    } catch (e) {
      emit(StaticTripFail(errMessage: e.toString()));
    }
  }
}
