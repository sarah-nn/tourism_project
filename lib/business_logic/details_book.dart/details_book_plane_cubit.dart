import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/details_book_plane_model.dart';
import '../../core/utils/end_point.dart';
part 'details_book_plane_state.dart';

class DetailsBookPlaneCubit extends Cubit<DetailsBookPlaneState> {
  DetailsBookPlaneCubit() : super(DetailsBookPlaneInitial());
  var data1 = [];

  DetailsBookPlaneModel? detailsBookPlane;
  String? message;
  Future<DetailsBookPlaneModel?> getAllDetailsBookPlane() async {
    var uri = Uri.parse(EndPoint.detailsBookPlane);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsBookPlaneLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        detailsBookPlane = DetailsBookPlaneModel.fromJson(data);
        emit(DetailsBookPlaneSuccess(detailsBookPlane!));
      } else {
        var message = json.decode(response.body);
        print("api error${response.statusCode}");
        emit(DetailsBookPlaneFailure(errMessage: message['message']));
      }
    } catch (e) {
      try {
        emit(DetailsBookPlaneFailure(errMessage: e.toString()));
      } catch (e) {}
    }
    print(detailsBookPlane);
    return detailsBookPlane;
  }
}
