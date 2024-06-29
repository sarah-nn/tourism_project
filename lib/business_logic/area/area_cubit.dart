import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
part 'area_state.dart';

class AreaCubit extends Cubit<AreaState> {
  AreaCubit() : super(AreaInitial());

  var data = [];
  List<String> areaList = [];

  getArea(String areaId) async {
    emit(AreaLoading());
    http.Response response = await http.post(Uri.parse(EndPoint.area), body: {
      'country_id': areaId
    }, headers: {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final areas = jsonData['data'][0]['areas'];

      areaList = List<String>.from(areas.map((area) => area['name']));
      emit(AreaSuccess(areaList: areaList));
    } else {
      var message = jsonDecode(response.body);
      print(message['message']);
      emit(AreaFailure(errMessage: message['message']));
    }
  }
}
