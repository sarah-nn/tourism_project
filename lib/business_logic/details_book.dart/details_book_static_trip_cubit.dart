import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/upcoming_previous_static_trip_model.dart';
import 'package:http/http.dart' as http;

part 'details_book_static_trip_state.dart';

class DetailsBookStaticTripCubit extends Cubit<DetailsBookStaticTripState> {
  DetailsBookStaticTripCubit() : super(DetailsBookStaticTripInitial());
  UpcomingAndPreviousStatikModel? upcomingAndPreviousStatikModel;
  dynamic data = [];
  dynamic message;

  Future<UpcomingAndPreviousStatikModel?>
      getBookStaticTripUpcomingAndPrevious() async {
    var uri = Uri.parse(EndPoint.detailsBookStaticTrip);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsBookStaticTripLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        upcomingAndPreviousStatikModel =
            UpcomingAndPreviousStatikModel.fromJson(data);
        print(response.body);
        emit(DetailsBookStaticTripSuccess(
            upcomingAndPreviousStatikModel: upcomingAndPreviousStatikModel));
      } else {
        var message = json.decode(response.body);
        emit(DetailsBookStaticTripFailure(
            errMessage: message['message'].toString()));
        print("api error ${response.statusCode} , with body ${response.body}");
      }
    } catch (e) {
      print("$e");

      //  emit(DetailsBookStaticTripFailure(errMessage: e.toString()));
    }
    return upcomingAndPreviousStatikModel;
  }

  // Future<void> deleteStaticTrip(String id) async {
  //   var uri = Uri.parse(EndPoint.deleteBookStaticTrip + id);
  //   var header = {'Authorization': 'Bearer $myToken'};
  //   var response = await http.delete(uri, headers: header);
  //   try {
  //     if (response.statusCode == 200) {
  //       message = json.decode(response.body);
  //       emit(DeleteBookStaticSuccess(message!, int.parse(id)));
  //     } else {
  //       message = json.decode(response.body);
  //       emit(DeleteBookStaticFailure(errMessage: message['message']));
  //     }
  //   } catch (e) {
  //     emit(DeleteBookStaticFailure(errMessage: e.toString()));
  //   }
  // }
}
