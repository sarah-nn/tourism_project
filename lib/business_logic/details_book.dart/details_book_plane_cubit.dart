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
  List<DetailsBookPlaneModel> detailsBookPlane = [];
  String? message;
  Future<List<DetailsBookPlaneModel>> getAllDetailsBookPlane() async {
    var uri = Uri.parse(EndPoint.detailsBookPlane);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsBookPlaneLoading());
      if (response.statusCode == 200) {
        data1 = json.decode(response.body)['data'];
        detailsBookPlane = data1
            .map((e) => DetailsBookPlaneModel.fromJson(e))
            .toList(growable: true);
        print(response.body);
        emit(DetailsBookPlaneSuccess(detailsBookPlane));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      //   emit(DetailsBookHotelFailure(errMessage: e.toString()));
    }
    print(detailsBookPlane);
    return detailsBookPlane;
  }
}
