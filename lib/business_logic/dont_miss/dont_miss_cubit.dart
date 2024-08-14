import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dont_miss_model.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/data/models/top_visited_model.dart';

part 'dont_miss_state.dart';

class DontMissCubit extends Cubit<DontMiisState> {
  DontMissCubit() : super(DontMiisInitial());
  var data1 = [];
  List<DontMissModel> dontMissModel = [];
  String? message;

  var data = [];
  List<TopVisitedModel> topVisitedModel = [];

  Future<List<DontMissModel>> getDontMiss() async {
    var uri = Uri.parse(EndPoint.dontMiss);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DontMiisLoading());
      if (response.statusCode == 200) {
        data1 = json.decode(response.body);
        dontMissModel =
            data1.map((e) => DontMissModel.fromJson(e)).toList(growable: true);
        print(response.body);
        emit(DontMiisSuccess(dontMissModel));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      try {
        emit(DontMiisFailure(errMessage: e.toString()));
      } catch (e) {
        print("object");
      }
    }
    print(dontMissModel);
    return dontMissModel;
  }

  Future<List<TopVisitedModel>> getTopVisited() async {
    var uri = Uri.parse(EndPoint.topVisited);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body)['data'];
        topVisitedModel =
            data.map((e) => TopVisitedModel.fromJson(e)).toList(growable: true);
        emit(TopVisitedSuccess(topVisitedModel));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("exception in ");
      emit(TopVisitedFailure(errMessage: e.toString()));
    }
    print(topVisitedModel);
    return topVisitedModel;
  }
}
