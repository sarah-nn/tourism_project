import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());

  Future<void> getAllPlace() async {
    var uri = Uri.parse(EndPoint.getAllActivity);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(ActivityLoading());
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        emit(ActivitySuccess(activities: data));
        print("activity $data");
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("exception in $e ");
      emit(ActivityFail(errMessage: e.toString()));
    }
  }
}
