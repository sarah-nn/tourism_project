import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/data/models/show_details_book_plane_model.dart';

part 'show_details_book_plane_state.dart';

class ShowDetailsBookPlaneCubit extends Cubit<ShowDetailsBookPlaneState> {
  ShowDetailsBookPlaneCubit() : super(ShowDetailsBookPlaneInitial());
  var data1 = [];
  ShowDetailsBookPlaneModel? showDetailsBookPlaneModel;
  ShowDetailsBookPlaneModel? editshowDetailsBookPlane;
  String tripNameVal = '';

  dynamic message;

  Future<ShowDetailsBookPlaneModel?> getAllShowDetailsBookPlane(
      String id) async {
    var uri = Uri.parse(EndPoint.showDetailsBookPlane + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(ShowDetailsBookPlaneLoading());
      if (response.statusCode == 200) {
        print('=============${response.body}');

        var data2 = json.decode(response.body)['data'];
        showDetailsBookPlaneModel = ShowDetailsBookPlaneModel.fromJson(data2);
        print('=============${response.body}');
        emit(ShowDetailsBookPlaneSuccess(showDetailsBookPlaneModel!));
      } else {
        print(response.statusCode);
        print("api error${response.statusCode}");
      }
    } catch (e) {
      //   emit(ShowDetailsBookPlaneFailure(errMessage: e.toString()));
    }

    print(showDetailsBookPlaneModel);
    return showDetailsBookPlaneModel;
  }

  Future<void> deletePlane(String id) async {
    var uri = Uri.parse(EndPoint.deleteBookinHotel + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.delete(uri, headers: header);
    try {
      if (response.statusCode == 200) {
        message = json.decode(response.body);
        emit(DeleteBookPlaneSuccess(message!, int.parse(id)));
      } else {
        message = json.decode(response.body);
        emit(DeleteBookPlaneFailure(errMessage: message['message']));
      }
    } catch (e) {
      emit(DeleteBookPlaneFailure(errMessage: e.toString()));
    }
  }

  Future<ShowDetailsBookPlaneModel?> editBookPlane({
    required String id,
    // required String nameTrip,
    required String numberOfPeople,
  }) async {
    var uri = Uri.parse(EndPoint.editBookPlane + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.post(uri, headers: header, body: {
      'trip_name': tripNameVal,
      'number_of_people': numberOfPeople,
    });
    try {
      // emit(ShowDetailsBookHotelLoading());
      if (response.statusCode == 200) {
        print(response.body);
        var data = json.decode(response.body)[0]['data'];
        editshowDetailsBookPlane = ShowDetailsBookPlaneModel.fromJson(data);

        emit(EditBookPlaneSuccess(editshowDetailsBookPlane!));
      } else {
        print('=============${response.body}');

        print(response.statusCode);

        print("api error${response.statusCode}");
        var message = json.decode(response.body);
        emit(EditBookPlaneFailure(message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      emit(EditBookPlaneFailure(e.toString()));
    }
    print('*************************************${editshowDetailsBookPlane}');
    return editshowDetailsBookPlane;
  }
}
